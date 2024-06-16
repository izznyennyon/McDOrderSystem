# Online Shop Web Application

## Overview
This project is a group assignment for our course, where we developed a web application using ASP.NET and C#. The application is designed to sell product items in categories such as restaurants, food delivery, groceries, or health products. This README provides an overview of the project, its features, and instructions for setup and usage.

## Team Members
- Member 1: Afeef (Afeefz2003@gmail.com)
- Member 2: Ammar (ammarkhair94@gmail.com)
- Member 3: Izz (izzdanial23@gmail.com)
- Member 4: Haziq (haziq@gmail.com)

## Course Learning Outcomes
1. **Build user interface using ASP.NET web and data controls and write programming methods within the Visual Studio Integrated Development Environment (IDE).** (P3, PLO8)
2. **Demonstrate good communication, teamwork, leadership, problem solving and lifelong learning.** (A4, PLO3)
3. **Analyse, formulate and solve application development problems by applying appropriate development techniques to meet specified requirements of the application.** (C4, PLO9)

## Project Features
1. **CSS and Master Page:** The application uses a master page and CSS for a consistent and responsive interface design.
2. **Menu Items with Images:** Each product item is displayed with an image for better visual representation.
3. **Menu Selection and Quantity:** Users can select products and specify quantities for purchase.
4. **Calculation of Sales:** The application calculates the total sales amount, including necessary taxes.
5. **Sales Cart:** Users can add items to a cart and view their selected items before checkout.
6. **Transaction Data Storage:** All transaction data is stored in a database.
7. **Sales Information and Receipt:** Detailed sales information and receipts are generated for each transaction.
8. **User Registration and Login:** The application supports user registration and login for both customers and admins.
9. **Page Authorization:** Different access levels for customers and admins ensure proper authorization.
10. **Sales Reporting:** Admins can view detailed sales reports and executive summaries.

## Additional Features
- Custom styling using Bootstrap for a modern UI.
- Additional validation controls to enhance data integrity.
- Extended reporting capabilities for better sales insights.

## Setup and Installation
1. **Clone the repository:**
   ```bash
   git@github.com:izznyennyon/McDOrderSystem.git

2. **Open the project in Visual Studio.**

3. **Restore NuGet packages:**
 ```bash
   Update-Package -reinstall
```
4. **Set up the database:**
- Create a new database in SQL Server.
- Run the SQL scripts provided in the DatabaseScripts folder to set up tables and stored procedures.

5. **Update the connection string:**
- In web.config, update the connection string to match your database configuration.

6. **Build and run the application:**
- Press F5 in Visual Studio to build and run the application.



