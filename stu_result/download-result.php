<?php
session_start();

require_once('includes/configpdo.php');

require('fpdf186/fpdf.php');

// Get rollid and classid from session
$rollid = $_SESSION['rollid'];
$classid = $_SESSION['classid'];

// Fetch student details
$query = "SELECT tblstudents.StudentName, tblstudents.RollId, tblstudents.RegDate, tblstudents.StudentId, tblstudents.Status, tblclasses.ClassName, tblclasses.Section FROM tblstudents JOIN tblclasses ON tblclasses.id = tblstudents.ClassId WHERE tblstudents.RollId=? AND tblstudents.ClassId=?";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("ss", $rollid, $classid);
$stmt->execute();
$result = $stmt->get_result();
$student = $result->fetch_object();

// Create a new FPDF instance
$pdf = new FPDF();

// Add a page
$pdf->AddPage();

// Set font for the entire document
$pdf->SetFont('Arial', 'B', 16);

// Add student details
$pdf->Cell(0, 10, 'Student Result', 0, 1, 'C');
$pdf->Cell(0, 10, 'Student Name: ' . $student->StudentName, 0, 1, 'C');
$pdf->Cell(0, 10, 'Roll ID: ' . $student->RollId, 0, 1, 'C');
$pdf->Cell(0, 10, 'Class: ' . $student->ClassName . ' (' . $student->Section . ')', 0, 1, 'C');
$pdf->Ln(10);

// Add result table
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(40, 10, 'Subject', 1, 0, 'C');
$pdf->Cell(40, 10, 'Marks', 1, 1, 'C');

// Fetch and add result data
$query = "SELECT t.StudentName, t.RollId, t.ClassId, t.marks, SubjectId, tblsubjects.SubjectName FROM (SELECT sts.StudentName, sts.RollId, sts.ClassId, tr.marks, SubjectId FROM tblstudents as sts JOIN tblresult as tr ON tr.StudentId=sts.StudentId) as t JOIN tblsubjects ON tblsubjects.id=t.SubjectId WHERE (t.RollId=? AND t.ClassId=?)";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("ss", $rollid, $classid);
$stmt->execute();
$result = $stmt->get_result();
$totalMarks = 0;
while ($row = $result->fetch_object()) {
    $pdf->Cell(40, 10, $row->SubjectName, 1);
    $pdf->Cell(40, 10, $row->marks, 1, 1, 'C');
    $totalMarks += $row->marks;
}

// Add total marks and percentage
$pdf->Cell(40, 10, 'Total Marks:', 1, 0, 'R');
$pdf->Cell(40, 10, $totalMarks, 1, 1, 'C');
$pdf->Cell(40, 10, 'Percentage:', 1, 0, 'R');
$pdf->Cell(40, 10, round(($totalMarks / ($result->num_rows * 100)) * 100, 2) . '%', 1, 1, 'C');

// Output PDF to file
$pdfFilePath = 'Result.pdf';
$pdf->Output($pdfFilePath, 'F');

// Check if the file was created successfully
if (file_exists($pdfFilePath)) {
    // Send the appropriate headers for file download
    header('Content-Description: File Transfer');
    header('Content-Type: application/pdf');
    header('Content-Disposition: attachment; filename="' . basename($pdfFilePath) . '"');
    header('Content-Length: ' . filesize($pdfFilePath));
    readfile($pdfFilePath);
    exit;
} else {
    // PDF file creation failed
    die('Failed to generate PDF file.');
}
?>
