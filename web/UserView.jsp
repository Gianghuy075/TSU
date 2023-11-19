<%-- 
    Document   : UserView
    Created on : Oct 2, 2023, 3:19:33 PM
    Author     : ^Zin^
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <<link rel="stylesheet" href="./css/UserView.css"/>
        <link rel="stylesheet" href="./css/headerManager.css"/>

    </head>
    <body>
        <header class="header">
            <a href="HomePage.jsp" class="logo">ABCD</a>
            <nav class="navbar" style="margin: 0;padding: 10px">
                <a href="HomePage.jsp">Home</a>
                <a href="About.jsp">About Us</a>
                <a href="Business.jsp">Business Area</a>
                <a href="products.jsp">Product</a>
                <a href="Contact.jsp">Contact</a><!-- comment -->

                <% if(request.getSession().getAttribute("fullname") != null) { %>
                <a href="#" class="dropdown-toggle"><b>${fullname}</b></a>
                        <% } %>    
                        <% if(request.getSession().getAttribute("username") == null) { %>      
                <a class="nav-link" href="login">Log in</a>    
                <% } else { %>
                <ul class="dropdown-menu" style="background-color: #00B98E ; color: #fff; margin-left: 77%;width: 200px;">
                    <c:if test="${sessionScope.RoleID == 1}">
                        <li style=" list-style: none;"><a class="text-decoration-none" href="signup">Add Account</a></li>
                        <li style=" list-style: none;"><a class="text-decoration-none" href="listAccount">List Account</a></li>
                        </c:if>
                        <c:if test="${sessionScope.RoleID == 2}">
                        <li style=" list-style: none;width: 300px;"><a class="text-decoration-none" href="manager_noti.jsp" style="color:#fff;">Manager Screen</a></li>
                        </c:if>
                        <c:if test="${sessionScope.RoleID == 3}">
                        <li style=" list-style: none;width: 300px;"><a class="text-decoration-none" href="usernoti">User Screen</a></li>
                        </c:if> 

                    <li style=" list-style: none;width: 300px; "><a class="text-decoration-none"  href="recovery?service=resetPassword">Change Password</a></li>
                    <li style=" list-style: none;"><a class="text-decoration-none" href="login?logout=true">Logout</a></li>
                </ul>
                <% } %>        
            </nav>
            <script src="./js/headerjs.js"></script>
        </header>    
        <div class="Container Bdy" style="padding-top: 9%;">
            <div class="row">
                <div class="col-10">
                    <div class="DetailFr">
                        <form action="UserView" method="Post">
                            <div class="Bdy-choose" style="padding-left: 11%;">
                                <div style="font-size: 22px">                       
                                    Type: <select name="typeS" id="typeS" >
                                        <option value="0" ${type == "0" ? "selected" : ""}>Select here</option>
                                        <option value="1" ${type == '1' ? 'selected' : ''}>Tiểu học cơ sở</option>
                                        <option value="2" ${type == '2' ? 'selected' : ''}>Trung học cơ sở</option>
                                        <option value="3" ${type == '3' ? 'selected' : ''}>Trung học Phổ Thông</option>
                                    </select>
                                </div>
                                <div style="font-size: 22px">
                                    School: 
                                    <input type="text" value="${sch}" name="school" id="school"required>
                                </div>
                                <div style="font-size: 22px">
                                    Class: 
                                    <input type="text" name="classes" value="${cl}" id="classes" required>
                                </div>
                                <input type="submit" value="Search">
                            </div>
                        </form>
                    </div>

                    <div class="DetailSc">

                        <table style="width: 100%; height: 100px; font-size: 22px ">
                            <tr>
                                <c:if test="${id != 0 && id!=null}">
                                    <td style="width: 33%; padding-left: 162px">Teacher: ${tea.teacherName}</td>
                                    <td>Phone Number: ${tea.tPhoneNum}</td>
                                </c:if>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>          
        <div class="container mt-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-12">
                    <div class="rounded">
                        <c:if test="${id != 0 && id!=null}">
                            <div class="table-responsive table-borderless">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                                Stt
                                            </th>
                                            <th>Name </th>
                                            <th>Giới tính</th>
                                            <th>Chiều Cao</th>
                                            <th>Cân Nặng</th>
                                            <th>Áo sơ mi</th>
                                            <th>Size</th>
                                            <th>Bộ thể thao</th>
                                            <th>Size</th>
                                            <th>Áo Khoác</th>
                                            <th>Size</th>                                
                                            <th>Status</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-body" id="table-body">
                                        <c:forEach items="${listDetail}" var="c" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${c.st.name}</td>
                                                <td>
                                                    <c:if test="${c.st.gender == 1}">
                                                        Male
                                                    </c:if>
                                                    <c:if test="${c.st.gender == 0}">
                                                        Female
                                                    </c:if>
                                                </td>
                                                <td>${c.st.height}</td>
                                                <td>${c.st.weight}</td>
                                                <c:forEach items="${c.detail}" var="o">
                                                    <td>${o.numPr}</td>
                                                    <td>${o.size}</td>
                                                </c:forEach>
                                                <td>${c.st.status}</td>
                                                <td><c:if test="${c.st.edit==1}">
                                                        <a href="#editStudentModal" data-type="${type}" data-school="${sch}" data-classes="${cl}" data-id="${c.st.id}" data-name="${c.st.name}" data-gender="${c.st.gender}" data-height="${c.st.height}"data-weight="${c.st.weight}" 
                                                           <c:forEach items="${c.detail}" var="o">
                                                               <c:if test="${o. productid == 1}">
                                                                   data-shirt="${o.numPr}" 
                                                                   data-shirtsize="${o.size}"
                                                               </c:if>
                                                               <c:if test="${o. productid == 2}">
                                                                   data-sportswear="${o.numPr}" 
                                                                   data-sportswearsize="${o.size}"
                                                               </c:if>
                                                               <c:if test="${o. productid == 3}">
                                                                   data-jacket="${o.numPr}"
                                                                   data-jacketsize="${o.size}"
                                                               </c:if>
                                                           </c:forEach> 
                                                           data-status="${c.st.status}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                    </c:if>
                                                    <c:if test="${c.st.edit==0}">
                                                        <a  style="pointer-events: none" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xe611;</i></a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div>
                                    <a href="HomePage.jsp" class="next">&laquo; Back Home </a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="Note-warning">                       
            <c:if test="${id == null}">
                <h1>Please select Type, School and Class to review data</h1>
            </c:if>
        </div>
        <c:if test="${id == 0}">                       
            <div class="Note-warning">                                
                <h2>There is no data: Type: 
                    <c:if test="${type == 0}"> 
                        ' ',
                    </c:if>
                    <c:if test="${type == 1}"> 
                        'Tiểu học cơ sở',
                    </c:if>
                    <c:if test="${type == 2}"> 
                        'Trung học cơ sở',
                    </c:if>
                    <c:if test="${type == 3}"> 
                        'Trung học phổ thông',
                    </c:if>

                    School: '${sch}', 'Class: ${cl}' </h2>        
            </div>
        </c:if>
        <div id="editStudentModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editStudentUser" method="POST">                
                        <input type="hidden"  name="edittype" id="editType">
                        <input type="hidden"  name="editschool" id="editSchool">
                        <input type="hidden"  name="editclasses" id="editClasses">
                        <div class="modal-header">			
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Edit Student</h4>
                            <div class="form-group row" style="margin-bottom: 0;margin-top: 4%;font-size: 15px;">
                                <label class="col-sm-3 col-form-label" style="margin: 0;padding: 0;padding-left: 16px;">Student ID :</label>
                                <div class="col-sm-2" style="padding: 0;">
                                    <input name="editid" id="editID" type="text" class="no-border" required readonly>
                                </div>
                                <label class="col-sm-3 col-form-label" style="margin: 0;padding: 0;">Student Name :</label>
                                <div class="col-sm-3" style="padding: 0;">
                                    <input type="text" name="editname" id="editName" class="no-border" required readonly>
                                </div>
                            </div>

                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Gender</label>
                                <select name="editgender" id="editGender" class="form-control">
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Chiều cao</label>
                                <input type="number" min="0" name="editheight" id="editHeight" class="form-control" required="Height is invaild">
                            </div>
                            <div class="form-group">
                                <label>Cân nặng</label>
                                <input type="number" min="0" name="editweight" id="editWeight" class="form-control" required="Weight is invaild">
                            </div>
                            <!-- Trường Áo sơ mi -->
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" style="margin: 0;padding: 0;padding-left: 16px;">Áo sơ mi</label>
                                <div class="col-sm-5" style="padding-left: 0;">
                                    <input type="number" min="0" name="editshirt" id="editShirt" class="form-control" required>
                                </div>
                                <label class="col-sm-1 col-form-label" style="margin: 0;padding: 0">Size</label>
                                <div class="col-sm-4" style="padding-left: 0;">
                                    <input type="text" min="0" name="editshirtsize" id="editShirtSize" class="form-control" required readonly>
                                </div>
                            </div>


                            <!-- Trường Bộ thể thao -->
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" style="margin: 0;padding: 0;padding-left: 16px;">Bộ thể thao</label>
                                <div class="col-sm-5" style="padding-left: 0;">
                                    <input type="number" min="0" name="editsportswear" id="editSportswear" class="form-control" required >
                                </div>
                                <label class="col-sm-1 col-form-label" style="margin: 0;padding: 0">Size</label>
                                <div class="col-sm-4" style="padding-left: 0;">
                                    <input type="text" min="0" name="editsportswearsize" id="editSportswearSize" class="form-control" required readonly>
                                </div>
                            </div>
                            <!-- Trường Áo khoác -->
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label" style="margin: 0;padding: 0;padding-left: 16px;">Áo khoác</label>
                                <div class="col-sm-5" style="padding-left: 0;">
                                    <input type="text" min="0" name="editjacket" id="editJacket" class="form-control" required>
                                </div>
                                <label class="col-sm-1 col-form-label" style="margin: 0;padding: 0">Size</label>
                                <div class="col-sm-4" style="padding-left: 0;">
                                    <input type="text" min="0" name="editjacketsize" id="editJacketSize" class="form-control" required readonly>                         
                                </div>
                            </div>


                            <div class="form-group">
                                <label>Status</label>
                                <input type="text" name="editstatus" id="editStatus" class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer id="footer" class="footer-entertainment" style="background-color: #00B98E;color: white;padding-top: 2%"> 
            <div class="container">
                <div class="row footer-row">
                    <div class="col-sm-5">
                        <div class="widget">
                            <h5 class="widget-title">C&#244;ng ty cổ phần đầu tư v&#224; thương mại ABC</h5>
                            <p><strong>Trụ sở:</strong> 1 đường ABCD - TP AAAAAA</p>
                            <p><strong>VPGD:</strong> xxxxxxxxxxxxxxxxx – TP AAAAAAA</p>
                            <p><strong>Tel:</strong> 090 xxxxxxxx</p>

                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="widget">
                            <h5 class="widget-title">Li&#234;n kết trang</h5>

                            <ul class="widget-ul" style="margin-left: 0px;">
                                <li><a style="color: white" href="#">Profile</a></li>
                                <li><a style="color: white" href="#">Fashion</a></li>
                                <li><a style="color: white" href="#">Ch&#237;nh s&#225;ch bảo mật</a></li>
                                <li><a style="color: white" href="/trang-ca-nhan/dang-nhap">Phản &#225;nh khiếu nại</a></li>
                            </ul>

                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="widget widget_recent_posts">
                            <h5 class="widget-title">Tin mới nhất</h5>

                            <ul class="widget-ul" style="margin-left: 0px;">
                                <li><a style="color: white" href="#">Doanh nghiệp nộp thuế </a></li>
                                <li><a style="color: white" href="#">Th&#244;ng b&#225;o mời ch&#224;o h&#224;ng cạnh tranh g&#243;i thầu: Thu&#234; m&#225;y m&#243;c thiết bị ng&#224;nh may năm 2023</a></li>
                                <li><a style="color: white" href="#">Th&#244;ng b&#225;o vv Mời thầu&quot; Dịch vụ thu gom, vận chuyển, xử l&#253; chất thải nguy hại năm 2023-2024&quot;</a></li>
                            </ul>

                        </div>
                    </div>

                </div>

            </div>
        </footer>
        <!--End footer-->
        <script>
            $(document).ready(function () {
                // Bắt sự kiện click trên nút "Edit"
                $('.edit').click(function () {
                    var type = $(this).data('type');
                    var school = $(this).data('school');
                    var classes = $(this).data('classes');
                    var id = $(this).data('id');
                    var name = $(this).data('name');
                    var gender = $(this).data('gender');
                    var height = $(this).data('height');
                    var weight = $(this).data('weight');
                    var shirt = $(this).data('shirt');
                    var shirtsize = $(this).data('shirtsize');
                    var sportswear = $(this).data('sportswear');
                    var sportswearsize = $(this).data('sportswearsize');
                    var jacket = $(this).data('jacket');
                    var jacketsize = $(this).data('jacketsize');
                    var status = $(this).data('status');
                    // Điền giá trị vào trường "Name" trong modal
                    $('#editType').val(type);
                    $('#editSchool').val(school);
                    $('#editClasses').val(classes);
                    $('#editID').val(id);
                    $('#editName').val(name);
                    $('#editGender').val(gender);
                    $('#editHeight').val(height);
                    $('#editWeight').val(weight);
                    $('#editShirt').val(shirt);
                    $('#editShirtSize').val(shirtsize);
                    $('#editSportswear').val(sportswear);
                    $('#editSportswearSize').val(sportswearsize);
                    $('#editJacket').val(jacket);
                    $('#editJacketSize').val(jacketsize);
                    $('#editStatus').val(status);
                    // Các xử lý khác (nếu có)
                });
            });
            $(document).ready(function () {
                // Bắt sự kiện input trên các trường "Chiều cao", "Cân nặng", và "Gender"
                $('#editHeight, #editWeight, #editGender').on('input', function () {
                    var gender = $('#editGender').val();
                    var height = parseInt($('#editHeight').val());
                    var weight = parseInt($('#editWeight').val());
                    // Tính toán giá trị "Size" dựa trên giới tính, Chiều cao và Cân nặng
                    var shirtSize = calculateSize(gender, height, weight);
                    var sportswearSize = calculateSize(gender, height, weight);
                    var jacketSize = calculateSize(gender, height, weight);
                    if (shirtSize === 6) {
                        $('#editStatus').val("Chêch lệch chiều cao cân nặng quá lớn");
                        $('#editShirtSize').val("");
                        $('#editSportswearSize').val("");
                        $('#editJacketSize').val("");
                    } else if (shirtSize === 7) {
                        $('#editStatus').val("Chiều cao thấp so với size tối thiểu");
                        $('#editShirtSize').val("");
                        $('#editSportswearSize').val("");
                        $('#editJacketSize').val("");
                    } else if (shirtSize === 8) {
                        $('#editStatus').val("Cân nặng thấp so với size tối thiểu");
                        $('#editShirtSize').val("");
                        $('#editSportswearSize').val("");
                        $('#editJacketSize').val("");
                    } else if (shirtSize === 9) {
                        $('#editStatus').val("Chiều cao cao so với size tối đa");
                        $('#editShirtSize').val("");
                        $('#editSportswearSize').val("");
                        $('#editJacketSize').val("");
                    } else if (shirtSize === 10) {
                        $('#editStatus').val("Cân nặng cao so với size tối đa");
                        $('#editShirtSize').val("");
                        $('#editSportswearSize').val("");
                        $('#editJacketSize').val("");
                    } else {
                        // Cập nhật giá trị của các trường "Size" tương ứng
                        $('#editStatus').val("");
                        $('#editShirtSize').val(shirtSize);
                        $('#editSportswearSize').val(sportswearSize);
                        $('#editJacketSize').val(jacketSize);
                    }
                });
                function calculateBMI(height, weight) {
                    const heightMeters = height / 100; // Chuyển chiều cao từ cm sang m
                    return weight / (heightMeters * heightMeters); // Công thức tính BMI
                }

                // Hàm tính toán giá trị "Size" tương ứng
                function calculateSize(gender, height, weight) {
                    const sizeData = [
                        {heightMin: 100, heightMax: 125, weightMin: 14, weightMax: 30, size: 1},
                        {heightMin: 126, heightMax: 145, weightMin: 31, weightMax: 40, size: 2},
                        {heightMin: 146, heightMax: 165, weightMin: 41, weightMax: 65, size: 3},
                        {heightMin: 166, heightMax: 180, weightMin: 66, weightMax: 84, size: 4},
                        {heightMin: 181, heightMax: 200, weightMin: 85, weightMax: 108, size: 5}
                    ];
                    const BMI = calculateBMI(height, weight);
                    var find = 0;
                    for (const data of sizeData) {
                        if (height >= data.heightMin && height <= data.heightMax && weight >= data.weightMin && weight <= data.weightMax) {
                            find = data.size;
                        } else if (height >= 100 && height <= 125 && weight > 30) {
                            if (16 <= BMI && BMI <= 27) {
                                find = 1;
                            } else if (27 < BMI && BMI < 31) {
                                find = 2;
                            } else {
                                return 6;
                                break;
                            }
                        } else if (height >= 126 && height <= 145 && (weight > 40 || weight < 31)) {
                            if (13 <= BMI && BMI < 16) {
                                find = 1;
                            } else if (16 <= BMI && BMI <= 27) {
                                find = 2;
                            } else if (27 < BMI && BMI < 31) {
                                find = 3;
                            } else {
                                return 6;
                                break;
                            }
                        } else if (height >= 146 && height <= 165 && (weight > 65 || weight < 41)) {
                            if (13 <= BMI && BMI < 16) {
                                find = 2;
                            } else if (16 <= BMI && BMI <= 27) {
                                find = 3;
                            } else if (27 < BMI && BMI < 31) {
                                find = 4;
                            } else {
                                return 6;
                                break;
                            }
                        } else if (height >= 166 && height <= 180 && (weight > 84 || weight < 66)) {
                            if (13 <= BMI && BMI < 16) {
                                find = 3;
                            } else if (16 <= BMI && BMI <= 27) {
                                find = 4;
                            } else if (27 < BMI && BMI < 31) {
                                find = 5;
                            } else {
                                return 6;
                                break;
                            }
                        } else if (height >= 181 && height <= 200 && weight < 85) {
                            if (13 <= BMI && BMI < 16) {
                                find = 4;
                            } else if (16 <= BMI && BMI <= 27) {
                                find = 5;
                            } else {
                                return 6;
                                break;
                            }
                        } else if (height < 100) {
                            return find = 7;
                            break;
                        } else if (weight < 14) {
                            return find = 8;
                            break;
                        } else if (height > 200) {
                            return find = 9;
                            break;
                        } else if (weight > 108) {
                            return find = 10;
                            break;
                        }
                    }
                    switch (find) {
                        case 1:
                            return "XS";
                            break;
                        case 2:
                            return "S";
                            break;
                        case 3:
                            return "M";
                            break;
                        case 4:
                            return "L";
                            break;
                        case 5:
                            return "XL";
                            break;

                    }

                }
            });

        </script>
        <div class="footer" style="padding-top: 6%">

        </div>
    </body>

</html>
