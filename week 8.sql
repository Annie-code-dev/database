CREATE DATABASE ClinicBookingSystem;
USE ClinicBookingSystem;
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE
);
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE,
    hire_date DATE NOT NULL
);
CREATE TABLE Specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Doctor_Specialization (
    doctor_id INT NOT NULL,
    specialization_id INT NOT NULL,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(specialization_id) ON DELETE CASCADE
);
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    method ENUM('Cash', 'Card', 'Mobile') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, phone, email)
VALUES 
('John', 'Doe', '1990-05-15', 'Male', '0712345678', 'john.doe@email.com'),
('Mary', 'Wanjiku', '1985-09-22', 'Female', '0723456789', 'mary.wanjiku@email.com');
INSERT INTO Doctors (first_name, last_name, phone, email, hire_date)
VALUES
('Alice', 'Kamau', '0734567890', 'alice.kamau@clinic.com', '2020-03-01'),
('Brian', 'Otieno', '0745678901', 'brian.otieno@clinic.com', '2021-07-15');
INSERT INTO Specializations (name)
VALUES
('Pediatrics'),
('Cardiology'),
('Dermatology');
-- Alice Kamau → Pediatrics & Dermatology
INSERT INTO Doctor_Specialization (doctor_id, specialization_id)
VALUES 
(1, 1),
(1, 3);

-- Brian Otieno → Cardiology
INSERT INTO Doctor_Specialization (doctor_id, specialization_id)
VALUES 
(2, 2);
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, '2025-09-28 10:00:00', 'Scheduled'),
(2, 2, '2025-09-29 14:30:00', 'Scheduled');
INSERT INTO Payments (appointment_id, amount, payment_date, method)
VALUES
(1, 2000.00, '2025-09-28 10:15:00', 'Mobile'),
(2, 3500.00, '2025-09-29 14:45:00', 'Card');

