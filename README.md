Vision and Scope Document
For
Management of student uniforms Version 1.0 
Prepared by Giang Huy
Process Impact




September 19, 2023
 
Table of Contents

Table of Contents	ii
Revision History	ii
1.	Business Requirements	1
1.1.	Background	1
1.2.	Business Opportunity	1
1.3.	Business Objectives	1
1.4.	Success Metrics	1
1.5.	Vision Statement	1
1.6.	Business Risks	2
1.7.	Business Assumptions and Dependencies	2
2.	Scope and Limitations	2
2.1.	Major Features	2
2.2.	Scope of Initial and Subsequent Releases	3
2.3.	Limitations and Exclusions	3
3.	Business Context	4
3.1.	Stakeholder Profiles	4
3.2.	Project Priorities	5
3.3.	Deployment Considerations	5




Revision History


Name	Date	Reason For Changes	Version
Giang Tuấn Huy	17/9/2023	initial draft	1.0 draft 1
			
 
1.	Business Requirements
1.1.	Background
In the last 10 years, employees of company A have been spending a lot of time collecting and processing data for the company. It will take staff about 1-2 days to collect student data (Student height and weight) from a school (depending on the number of staff). Once all the information (Student height and weight) of all students is available, the staff needs to enter that information into the computer at the company. That will take an extra day of work for that employee. That keeps happening to the company when it has to work with over 90 customers (schools).
1.2.	Business Opportunity
Management requested a system that could allow employees to enter data (Student height and weight) into the system. From there, it is possible to shorten employee data collection time from 3 days to 1 day. In addition, Managers can monitor employee activities to find possible errors (wrong data, etc.). This system can both manage and send work information to employees more easily. And Staff can collect and process data faster.
1.3.	Business Objectives
BO-1: 40% reduction in time in terms of data collection.
Scale: 45 minutes to 1 hour for 1 class(with 1 Staff).
Past: more than 20 hours per School.
Goal: Less than 60% time.
Stretch: Less than 10%

BO-2: Shorten the entire data entry and data checking time.
1.4.	Success Metrics
SM-1: Data Collection Time Reduction: Measure the time it takes to collect student height and 
weight data before and after implementing the system.

SM-2: Assess the accuracy of the data collected. Track the number of errors or discrepancies in 
the data before and after the system's implementation. The success metric could be significant. 
reduction in data errors.

SM-2: Employee Productivity: Measure how much faster employees can collect and process data with the new system. You can track the number of data entries completed per hour or per employee before and after the system's implementation.

SM-3: System Usability: Collect feedback from employees and managers on the usability of the 
system. Use surveys or user satisfaction scores to assess how easy and efficient it is to use the 
system.
1.5.	Vision Statement
Compared to the past, the new data management system represents a significant improvement in several key ways. In the past, data collection from schools was a time-consuming process, often taking 1-2 days per school, depending on the number of staff involved. Once collected, data entry at the company added another day of work for employees. This manual process could be extremely time-intensive and error-prone, especially when dealing with over 90 schools.

In contrast, the new system streamlines this process by allowing employees to directly input data online into the system, reducing data collection and entry time from 3 days to just 1 day. Managers can monitor data entry in real-time, ensuring data accuracy and addressing errors promptly. The system also organizes and stores data efficiently, improving workflow and communication within the company. As the company grows, the system can easily scale to handle increased workload. Overall, it represents a more efficient, accurate, and adaptable solution compared to the labor-intensive processes of the past.
1.6	.   Business Risks
RI-1:	There may be risks related to data security and privacy. Storing and managing student data involves sensitive information. If the system is not adequately secured, there is a risk of data breaches or unauthorized access, potentially leading to legal and reputational issues. . (Probability = 0.6; Impact = 0.9)
RI-2:	The implementation of a new data management system may encounter technological challenges. This could include issues with system integration, software bugs, or hardware failures, which might lead to downtime or disruptions in data processing. (Probability = 0.4; Impact = 0.9)
RI-3:	Employees who are accustomed to the old manual processes may resist the adoption of the new system. Change management challenges, such as training and adjusting to new workflows, could affect the project's success. (Probability = 0.6; Impact = 0.7)
RI-4:	As the project aims to work with over 90 schools, there may be concerns about the system's scalability. If the system cannot handle the increasing volume of data and customers, it could lead to performance issues and hinder the company's growth. (Probability = 0.6; Impact = 0.9).
1.7.	 Business Assumptions and Dependencies
AS-1:	The successful integration of the new data management system with existing company systems and databases is critical.
AS-2:	To minimize resistance to change and ensure efficient system usage, it is assumed that employees will be well-prepared to operate the system. Inadequate training could lead to errors and reduced productivity.
DE-1:	. The new system must seamlessly interact with other internal systems to ensure efficient data flow and operations. Delays or complications in integration could hinder the project's progress and functionality.
2.	Scope and Limitations
2.1.	Major Features
FE-1:	Log in with the account provided by Admin. User can change password with email.
FE-2: Admin has the right to view the activity history of employees, add and delete employee accounts.
FE-3:	Managers have the right to add, edit information, and delete company products.
FE-4:	Managers can add customer data. Give employees permission to collect more customer information (Student height and weight). Managers can export detailed orders with each customer's due number.
FE-5:	People with Admin and Manager role can issue notifications to employees.
FE-6: Users can edit and save data when granted permission by the Manager.
FE-7:	Provide system access through corporate intranet, smartphone, tablet, and outside Internet access by authorized employees.

  
Figure 1. Partial feature tree for the Management of student uniforms System.
2.2.	Scope of Initial and Subsequent Releases
Feature	Release 1	Release 2	Release 3
FE-1, Log in 	Users can log in using accounts created by admin	Users can change password by email.	Fully implemented
FE-2, Admin Management	Add or remove employee accounts.	view the activity history of employees	Fully implemented
FE-3, Managers	add, edit information, and delete company products	Add image product and detail.	Fully implemented
FE-4, Managers add customer data.	Modify, delete, and archive Data	export detailed orders with each customer's due number
FE-5, Admin and Manager	issue notifications to employees	Fully implemented	Fully implemented
FE-6, User	edit and save data when granted permission by the Manager		
FE-7, System access	Intranet and outside Internet access	iOS and Android phone and tablet apps	Windows Phone and tablet apps
2.3.	Limitations and Exclusions
LI-1: Managers will have to set a certain time for employees to complete the data.
LI-2: Limit access to the company's customer data, so only managers know the details.
LI-3: Restrict the right to edit customer information.
3.	Business Context
3.1.	Stakeholder Profiles
Stakeholder	Major Value	Attitudes	Major Interests	Constraints
Manager	Improved employee productivity; cost savings for company	Strong commitment through release 2; support for release 3 contingent on earlier results	Cost and employee time savings must exceed development and usage costs	None identified
Employee	More efficient use of staff time throughout the day; higher customer satisfaction	Concern about union relationships and possible downsizing; otherwise, receptive	Job preservation	Training for staff in Internet usage and Excel needed; delivery staff and vehicles needed
Payroll Department
	No benefit; needs to set up the system.	Dissatisfied with the employee's time-consuming work, but recognizes the value to the company and employees	Create a system to reduce the time it takes to collect data information	None identified.

3.2.	Project Priorities
Dimension	Constraint	Driver	Degree of Freedom
Features	All features scheduled for release 1.0 must be fully operational		
Quality	80% of user acceptance tests must pass; all security tests must pass		
Schedule			Release 1 planned to be available by end of Q1 of next year, release 2 by end of Q2; overrun of up to 2 weeks acceptable without sponsor review
Staff		Team size is half-time project manager, half-time BA, 3 developers, and 1 tester: additional developer and half-time tester available if necessary	
3.3.	Deployment Considerations
The web server software will need to be upgraded to the latest version. Apps will have to be developed for iOS and Android smartphones and tablets as part of the second release, with corresponding apps for Windows, Phone and tablets to follow for the third release. Any corresponding infrastructure changes must be in place at the time of the second release. Videos no more than five minutes in length shall be developed to train users in both the Internet-based and app-based versions of COS.

