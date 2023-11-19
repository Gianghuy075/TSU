/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Detail;
import Model.DetailUser;
import Model.InvoiceSt;
import Model.Student;
import Utils.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.School;
import Model.StudentUser;
import Model.Teacher;
import Model.logo;
import java.sql.Date;
import java.util.Random;

/**
 *
 * @author Admin
 */
public class ClassesDAO extends DBConnect {

    public Teacher getTeacherNameTP(int type, String SchoolName, String Classes) {
        Teacher tea = new Teacher();
        String sql = "SELECT Teacher.TeacherName,Teacher.TPhoneNum "
                + "FROM Teacher "
                + "INNER JOIN Classes ON Teacher.classID = Classes.ClassID "
                + "INNER JOIN School ON School.schoolID = Classes.SchoolID "
                + "where School.[Level] = ? AND School.schoolName like ? AND Classes.Class = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, type);
            ps.setNString(2, SchoolName);
            ps.setString(3, Classes);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tea.setTeacherName(rs.getString(1));
                tea.settPhoneNum(rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tea;
    }

    public List<Student> getAllStudent(int type, String SchoolName, String Classes) {
        List<Student> list = new ArrayList<>();
        String querry = "SELECT Student.StudentID, Student.StudentName, Student.Sex,Student.height,Student.[weight], Student.[Status], Account.fullname\n"
                + "FROM Classes\n"
                + "INNER JOIN School ON School.schoolID = Classes.SchoolID\n"
                + "LEFT JOIN Student ON Classes.ClassID = Student.ClassID\n"
                + "LEFT JOIN Account ON Student.EditHistory = Account.id\n"
                + "WHERE School.[Level] = ?\n"
                + "  AND School.schoolName like ?\n"
                + "  AND Classes.Class = ?\n"
                + "  AND (Student.EditHistory IS NULL OR ISNUMERIC(Student.EditHistory) = 1)";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, type);
            ps.setNString(2, SchoolName);
            ps.setString(3, Classes);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(5) == null) {
                    list.add(new Student(rs.getInt(1),
                            rs.getString(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6),
                            "None"));
                } else {
                    list.add(new Student(rs.getInt(1),
                            rs.getString(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7)));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<StudentUser> getAllStudentbyuser(int type, String SchoolName, String Classes) {
        List<StudentUser> list = new ArrayList<StudentUser>();
        String querry = ("SELECT Student.StudentID, Student.StudentName, Student.Sex, Student.height,Student.[weight], Student.[Status],Classes.Confirm \n"
                + "FROM Classes \n"
                + "INNER JOIN School ON School.schoolID = Classes.SchoolID \n"
                + "INNER JOIN Student ON Classes.ClassID = Student.ClassID \n"
                + "where School.[Level] = ? AND School.schoolName = ? AND Classes.Class = ?");
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, type);
            ps.setNString(2, SchoolName);
            ps.setString(3, Classes);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new StudentUser(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Student getStudentById(int id) {

        String querry = "select * from Student where StudentID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Student(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Detail> getAllDetail(int id) {
        List<Detail> detail = new LinkedList<>();
        String querry = "select * from Product \n"
                + "Left join (select * from Detail where StudentID = ?) As d on Product.productID = d.ProductID";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(5) == null) {
                    detail.add(new Detail(rs.getInt(1),
                            0, rs.getString(6)));
                } else {
                    detail.add(new Detail(rs.getInt(1),
                            rs.getInt(5), rs.getString(6)));
                }
            }

        } catch (Exception e) {

        }
        return detail;
    }

    public List<DetailUser> getAllDetailUser(int id) {
        List<DetailUser> detail = new LinkedList<>();
        String querry = "select * from Product \n"
                + "Left join (select * from Detail where StudentID = ?) As d on Product.productID = d.ProductID";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(5) == null) {
                    detail.add(new DetailUser(rs.getInt(1),
                            0, rs.getString(6)));
                } else {
                    detail.add(new DetailUser(rs.getInt(1),
                            rs.getInt(5), rs.getString(6)));
                }
            }

        } catch (Exception e) {

        }
        return detail;
    }

    public boolean checkDetail(String sid, String pid) {

        String querry = "select * from Detail where ProductID = ? and StudentID =? ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, pid);
            ps.setString(2, sid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public void insertIntoDetail(String sid, String pid, String num) {
        String querry = "Insert into Detail values(?,?,?) ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, pid);
            ps.setString(2, sid);
            ps.setString(3, num);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void insertIntoDetailUser(String sid, String pid, String num, String size) {
        String querry = "Insert into Detail values(?,?,?,?) ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, pid);
            ps.setString(2, sid);
            ps.setString(3, num);
            ps.setString(4, size);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateDetail(String sid, String size) {
        String querry = "Update Detail set size = ? where StudentID =? ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(2, sid);
            ps.setString(1, size);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateDetailUser(String sid, String pid, String num, String size) {
        String querry = "Update Detail set num = ?,size = ? where ProductID = ? and StudentID =? ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(3, pid);
            ps.setString(4, sid);
            ps.setString(1, num);
            ps.setString(2, size);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateStudent(String sid, String name, String gender, String status) {
        String querry = "Update Student set StudentName = ?, sex = ?,[Status]= ? where StudentID = ?  ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(2, gender);
            ps.setString(4, sid);
            ps.setNString(1, name);
            ps.setNString(3, status);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void UpdateStudentUser(String sid, String name, String gender, int height, int weight, String status) {
        String querry = "Update Student set StudentName = ?, sex = ?,height = ?,[weight] = ?,[Status]= ? where StudentID = ?  ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(2, gender);
            ps.setString(6, sid);
            ps.setNString(1, name);
            ps.setInt(3, height);
            ps.setInt(4, weight);
            ps.setNString(5, status);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int GetIDAccountbyname(String name) {
        String querry = "select id from Account where fullName like ?  ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, name);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public void UpdateEditby(int id,String stid ) {
        String querry = "update Student set EditHistory = ? where StudentID = ?  ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ps.setString(2, stid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public School getSchoolByLevelAndName(String level, String name) {

        String querry = " select * from School where [Level] = ? and schoolName= ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, level);
            ps.setNString(2, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new School(rs.getInt(1), rs.getInt(2), rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Teacher getTeacherbyClassID(int id) {
        String sql = "select TeacherName,TPhoneNum from Teacher where classID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Teacher(rs.getString(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getSchoolnamebyClassID(int id) {

        String querry = "select schoolName from School inner join Classes on School.schoolID=Classes.ClassID where ClassID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public School getSchoolById(String id) {

        String querry = " select * from School where  schoolID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new School(rs.getInt(1), rs.getInt(2), rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public logo getLogo(String id, String pid) {

        String querry = "  select * from logo where schoolID = ? and Pid = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, id);
            ps.setString(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new logo(rs.getInt(1), getSchoolById(id), rs.getString(3));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new logo(0, getSchoolById(id), null);
    }

    public void insertIntoLogo(String schoolid, String pid, String img) {
        String querry = "Insert into logo values(?,?,?) ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, schoolid);
            ps.setString(2, img);
            ps.setString(3, pid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateLogo(String schoolid, String pid, String img) {
        String querry = "Update logo set Image = ? where Pid = ?  and schoolid = ?  ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(3, schoolid);
            ps.setString(1, img);
            ps.setString(2, pid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int getClassID(int level, String sch, String cl) {
        String querry = "select Classes.ClassID from Classes inner join School on Classes.SchoolID=School.schoolID where School.Level = ? \n"
                + "and School.schoolName = ? and Classes.Class = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, level);
            ps.setString(2, sch);
            ps.setString(3, cl);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getLockdata(int level, String sch, String cl) {
        String querry = "select Classes.Confirm from Classes inner join School on Classes.SchoolID=School.schoolID where School.Level = ? \n"
                + "and School.schoolName = ? and Classes.Class = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, level);
            ps.setString(2, sch);
            ps.setString(3, cl);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) != 0) {
                    return 1;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void lockdata(int classID) {
        String querry = "update Classes\n"
                + "set Confirm = 0 \n"
                + "where ClassID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, classID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void opendata(int classID) {
        String querry = "update Classes\n"
                + "set Confirm = 1 \n"
                + "where ClassID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, classID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void insertintoInvoice(Date date, int ClassID) {
        try {
            boolean isUnique = false;
            while (!isUnique) {
                Random random = new Random();
                int randomNumber = random.nextInt(900000) + 100000;
                String querry = "select InvoiceID from Invoice";
                PreparedStatement ps = connect.prepareStatement(querry);
                //ps.setInt(1, );
                ResultSet rs = ps.executeQuery();
                if (!rs.next()) {
                    String insertQuery = "insert into Invoice\n"
                            + "values (?,?,?)";
                    ps = connect.prepareStatement(insertQuery);
                    ps.setInt(1, randomNumber);
                    ps.setDate(2, date);
                    ps.setInt(3, ClassID);
                    ps.execute();
                    isUnique = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int GetNumPbyGender(int classID, int pID, String size, int sex) {

        String querry = "select Detail.ProductID,Product.NameP,sum(num) as dem,Detail.size from Detail inner join Student on Detail.StudentID= Student.StudentID \n"
                + "inner join Product on Product.productID=Detail.ProductID\n"
                + "group by Detail.ProductID,Student.ClassID,Product.NameP,Detail.size,Student.sex\n"
                + "having ClassID = ? and Detail.productID = ? and Detail.size like ? and Student.sex = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, classID);
            ps.setInt(2, pID);
            ps.setString(3, size);
            ps.setInt(4, sex);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(3);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int GetNumP(int classID, int pID, String size) {
        String querry = "select Detail.ProductID,Product.NameP,sum(num) as dem,Detail.size from Detail inner join Student on Detail.StudentID= Student.StudentID \n"
                + "inner join Product on Product.productID=Detail.ProductID\n"
                + "group by Detail.ProductID,Student.ClassID,Product.NameP,Detail.size\n"
                + "having ClassID = ? and Detail.productID = ? and Detail.size like ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, classID);
            ps.setInt(2, pID);
            ps.setString(3, size);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(3);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getIDinvoice(int id) {
        String sql = "select InvoiceID from Invoice where ClassID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String getClassName(int classID) {
        String querry = "select Class from Classes where ClassID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, classID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<InvoiceSt> getAllInvoice() {
        List<InvoiceSt> list = new LinkedList<>();
        String querry = "select * from Invoice inner join Classes on Invoice.ClassID=Classes.ClassID inner join School on Classes.SchoolID = School.schoolID \n"
                + "inner join Teacher on Teacher.classID = Classes.ClassID";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new InvoiceSt(rs.getInt(1), rs.getDate(2), rs.getString(6), rs.getString(10), rs.getString(13), rs.getInt(14)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getClassIDbyInvoiceID(int id) {

        String querry = "select ClassID from Invoice where InvoiceID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public Date getDatebyInvoiceID(int id) {
        String querry = "select Date from Invoice where InvoiceID = ?";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDate(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public void DeleteInvoice(String sid) {
        String querry = "delete from Invoice where InvoiceID = ? ";
        try {
            PreparedStatement ps = connect.prepareStatement(querry);
            ps.setString(1, sid);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        ClassesDAO dao = new ClassesDAO();
        int type = 1;
        String schoolName = "Trường A";
        String classes = "1A";
        System.out.println(dao.getAllStudent(1, "FPT university", "1A"));

    }
}
