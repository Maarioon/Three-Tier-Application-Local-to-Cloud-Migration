# Deploying a Web App with EC2 and RDS

Welcome to this step-by-step guide on **how to connect an EC2 instance to an RDS database** and migrate your local database to the cloud! 🌍✨

## ** Table of Contents**
1. [Introduction](#-introduction)
2. [Prerequisites](#-prerequisites)
3. [Step 1: Create an EC2 Instance](#-step-1-create-an-ec2-instance)
4. [Step 2: Create an RDS Instance](#-step-2-create-an-rds-instance)
5. [Step 3: Configure Security Groups](#-step-3-configure-security-groups)
6. [Step 4: Install Database Client on EC2](#-step-4-install-database-client-on-ec2)
7. [Step 5: Connect EC2 to RDS](#-step-5-connect-ec2-to-rds)
8. [Step 6: Migrate Your Database](#-step-6-migrate-your-database)
9. [Step 7: Update Your Application](#-step-7-update-your-application)
10. [Troubleshooting](#-troubleshooting)

---

## ** Introduction**
We are deploying a web application that uses a **cloud database** instead of a local one. This guide will show you how to:
- **Launch an EC2 instance** (a cloud server).
- **Create an RDS database** (Amazon’s managed database service).
- **Connect EC2 to RDS** securely.
- **Migrate a local database** to the cloud.


## ** Prerequisites**
Before we begin, ensure you have:
✅ **An AWS Account** ([Sign up here](https://aws.amazon.com/))
✅ **An SSH Key Pair** (Download it when creating EC2)
✅ **A database backup** (`database_backup.sql`)

Firstly install all dependences you so not have on your compter it is important to test on your local host before deploying to the cloud, 
install node, npm, mysql and any other dependencies you may need.
npm is used to test and build the app. cd into the app directory after installing all and run this command it would build and compile the application
```
npm run build 
```
![Screenshot 2025-02-06 185404](https://github.com/user-attachments/assets/b1ce4e28-4489-4cfb-a94f-9acee789f0c1)

create database and give it a name, create a table and a user, populate the table with data , create a mysql dump this will be moved to the cloud 
![Screenshot 2025-02-07 192457](https://github.com/user-attachments/assets/509515b3-bf6e-4fcd-bbac-5f6a4b7b0076)
![Screenshot 2025-02-07 192548](https://github.com/user-attachments/assets/e361e44f-06ae-4058-aeb1-3d48acfcff88)
![Screenshot 2025-02-07 192534](https://github.com/user-attachments/assets/e1594f26-b34c-4c76-8322-2c2d8e730e1c)

using local host confirm if the npm build is showing on the port number
![Screenshot 2025-02-06 134625](https://github.com/user-attachments/assets/116540c0-04b5-4ee7-8614-8de758fb7b67)

## ** Step 1: Create an EC2 Instance**
1️⃣ Go to **AWS Console** → **EC2** → Click **Launch Instance**
2️⃣ Choose **Ubuntu 22.04 LTS** (or any Linux OS you prefer).
3️⃣ Choose an instance type (e.g., `t2.micro` for free tier).
4️⃣ **Select an existing key pair** (or create a new one and download it!).
5️⃣ In **Security Groups**, allow:
   - **SSH (port 22)** → Your IP
   - **Custom TCP Rule (port 3306/5432)** → Allow RDS connections
6️⃣ Click **Launch Instance**!
![Screenshot 2025-02-07 192408](https://github.com/user-attachments/assets/5911ff0f-9d07-4158-bc26-4dae73f601b5)
![Screenshot 2025-02-15 120838](https://github.com/user-attachments/assets/d90229ce-10da-470a-b6fb-66ad170d699d)

## ** Step 2: Create an RDS Instance**
1️⃣ Go to **AWS Console** → **RDS** → **Create Database**
2️⃣ Choose **Engine Type:**
   - `MySQL` → Port **3306**
   - `PostgreSQL` → Port **5432**
3️⃣ Select **Free-tier** settings (`db.t3.micro`).
4️⃣ **Set Database Credentials:**
   - **DB Name:** `mydatabase`
   - **Username:** `admin`
   - **Password:** `yourpassword`
5️⃣ Click **Create Database** 🎉

🔹 **Get RDS Endpoint:** Go to **RDS Dashboard** → Click your DB → Copy `Endpoint` (e.g., `your-db.abcdefg.rds.amazonaws.com`)
![Screenshot 2025-02-15 120757](https://github.com/user-attachments/assets/66c521e1-b887-4af2-bafd-85a41683930c)
![Screenshot 2025-02-07 192838](https://github.com/user-attachments/assets/747467ca-3032-4db3-80f9-a1b797b83ac2)


## ** Step 3: Configure Security Groups**
### ** Allow EC2 to Access RDS**
1. Go to **EC2 → Security Groups**
2. Select **the Security Group attached to RDS**
3. Click **Edit Inbound Rules**
4. **Add Rule:**
   - **Type:** MySQL/Aurora (for MySQL) OR PostgreSQL (for PostgreSQL)
   - **Port:** `3306` (MySQL) or `5432` (PostgreSQL)
   - **Source:** **Custom** → Select **EC2 Security Group**
5. Click **Save**


## **🛠 Step 4: Install Database Client on EC2**
### **Connect to EC2 via SSH**
```sh
ssh -i /path/to/key.pem ubuntu@your-ec2-ip
```
![Screenshot 2025-02-07 192408](https://github.com/user-attachments/assets/5911ff0f-9d07-4158-bc26-4dae73f601b5)

### **For MySQL:**
```sh
sudo apt update && sudo apt install mysql-client -y
```
### **For PostgreSQL:**
```sh
sudo apt update && sudo apt install postgresql-client -y
```
![Screenshot 2025-02-07 192457](https://github.com/user-attachments/assets/cc3bb8c7-05cd-4af1-a03f-fda5325666e1)

![Screenshot 2025-02-07 192637](https://github.com/user-attachments/assets/02eaaca1-1958-4c6f-bd78-a8faac80940e)
![Screenshot 2025-02-07 192619](https://github.com/user-attachments/assets/3c844507-8ec0-4f32-b0b9-754e3372e62a)
![Screenshot 2025-02-07 192548](https://github.com/user-attachments/assets/524e85dd-e53e-4704-b072-67b0a581f1a9)
![Screenshot 2025-02-07 192534](https://github.com/user-attachments/assets/28fff5c3-9d88-4b26-8035-97541780d0c5)
![Screenshot 2025-02-07 192704](https://github.com/user-attachments/assets/c3b89d53-9e2b-4551-988d-76ff15f75da1)
![Screenshot 2025-02-07 192645](https://github.com/user-attachments/assets/1ea98840-7822-46ba-a55d-e74276890750)

move the database into the mysql database

## **🔗 Step 5: Connect EC2 to RDS**
### **For MySQL:**
```sh
mysql -h your-rds-endpoint.rds.amazonaws.com -u admin -p
```
### **For PostgreSQL:**
```sh
psql -h your-rds-endpoint.rds.amazonaws.com -U admin -d mydatabase
```
(Enter your password when prompted.)


## **📂 Step 6: Migrate Your Database**
### **Step 1: Transfer Backup File from Local Machine to EC2**
```sh
scp -i /path/to/key.pem database_backup.sql ubuntu@your-ec2-ip:/home/ubuntu/
```
### **Step 2: Restore Database on RDS**
```sh
mysql -h your-rds-endpoint.rds.amazonaws.com -u admin -p mydatabase < /home/ubuntu/database_backup.sql
```
![Screenshot 2025-02-07 192809](https://github.com/user-attachments/assets/0877eadf-203c-46ee-be19-e39bd8933986)


## **Step 7: Update Your Application**
### **For Django (Python)**
```plaintext
DATABASE_URL=mysql://admin:yourpassword@your-rds-endpoint.rds.amazonaws.com:5432/mydatabase
```
![Screenshot 2025-02-14 112714](https://github.com/user-attachments/assets/aae345d1-b319-40a3-ba97-439bcdaaf0f1)

![Screenshot 2025-02-07 192838](https://github.com/user-attachments/assets/4b7d7771-0d35-49d8-846f-fbfc47e35ce1)
![Screenshot 2025-02-07 192843](https://github.com/user-attachments/assets/7d429c7f-e0e3-441c-a3db-c86eee7192c1)

### **For Laravel (PHP)**
```plaintext
DB_CONNECTION=mysql
DB_HOST=your-rds-endpoint.rds.amazonaws.com
DB_PORT=3306
DB_DATABASE=mydatabase
DB_USERNAME=admin
DB_PASSWORD=yourpassword
```
## ** Troubleshooting**
###  **Permission Denied (SSH Key Issue)**
```sh
chmod 400 /path/to/key.pem
```
### 🚨 **Can't Connect to RDS?**
✔️ Check **RDS Security Group Rules**
✔️ Check **EC2 Security Group Rules**
✔️ Ensure RDS **is in the same region** as EC2

---

## **🎉 Conclusion**
✅ **EC2 is now connected to RDS!** 🎊
✅ **Your database is migrated!** 🚀
✅ **Your app is using a cloud database!** 🎯

🔹 **Now you can deploy a scalable web app in AWS!** 🌍💡

---

### **🔗 Useful Links**
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [MySQL Docs](https://dev.mysql.com/doc/)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)

---

Made with ❤️ by **[Your Name]**
