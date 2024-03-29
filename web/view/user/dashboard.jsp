<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>User Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">

        <style>
            .error {
                color: red;
            }
        </style>

    </head>

    <body id="page-top">

        <jsp:include page="navbar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                    <jsp:include page="breadCrumb.jsp"></jsp:include>

                        <!-- User Orders Table -->
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fas fa-table"></i>
                                User Orders
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="userOrdersTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Total price</th>
                                                <th>Create Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listOrder}" var="order">
                                            <tr>
                                                <td>${order.id}</td>
                                                <td>${order.amount}$</td>
                                                <td>${order.createAt}</td>
                                                <td><a href="#" data-toggle="modal" data-target="#orderDetailsModal_${order.id}">View Details</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Details Modal -->
                <c:forEach items="${listOrder}" var="order">
                    <div class="modal fade" id="orderDetailsModal_${order.id}" tabindex="-1" role="dialog" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="orderDetailsModalLabel">Order Details - ${order.id}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product ID</th>
                                                <th>Product Name</th>
                                                <th>Product price</th>
                                                <th>Product image</th>
                                                <th>Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrderDetails}" var="detail">
                                                <c:if test="${detail.orderId == order.id}">
                                                    <tr>
                                                        <td>${detail.productId}</td>

                                                        <c:forEach items="${listProduct}" var="product">
                                                            <c:if test="${product.id == detail.productId}">
                                                                <td>${product.name}</td>
                                                                <td>${product.price}$</td>
                                                                <td>
                                                                    <img src="${product.image}" width="100" height="100" alt="alt"/>
                                                                </td>
                                                            </c:if>
                                                        </c:forEach>

                                                        <td>${detail.quantity}</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /.container-fluid -->

            <!-- Sticky Footer -->
            <jsp:include page="footer.jsp"></jsp:include>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Logout Modal-->
    <jsp:include page="logOutModal.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor-admin/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor-admin/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor-admin/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>

</body>

</html>
