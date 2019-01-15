<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css" type="text/css"
	charset="utf-8" />
<link href="/Walala2019/src/main/webapp/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
<script src="js/bootstrap.min.js"></script>
<style>
table.loginform_table {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	max-width: 100%;
}

tr td {
	padding-bottom: 15px;
}

td.loginformlist {
	text-align: center;
}

div.loginform_main {
	position: absolute;
	top: 10%;
	left: 30%;
	width: 40%;
}
</style>
<title>�α���������</title>
</head>
<body>

	<jsp:include page="search_navbar.jsp"></jsp:include>

	<div class="loginform_main" style="margin: 100px; text-align: center">
		<h1>�α���</h1>
		<hr>
		<form class="form-horizontal">
			<table class='loginform_table'>
				<tr>
					<td class="loginformlist">
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
						</div>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="example@example.com">
						</div>
					</td>
				</tr>
				<tr>
					<td class="loginformlist">
						<div class="form-group">
							<label for="inputPassword"
								class="col-sm-2 control-label loginformlist">Password</label>
						</div>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPasswor3"
								placeholder="Password">
						</div>
					</td>
				</tr>
			</table>
			<%
				if (session.getAttribute("error") != null) {
			%>
			<%=session.getAttribute("error")%>
			<%
				}
			%><a href="joinform.do">ȸ������</a> <a href="findpasswordform.do">��й�ȣã��</a>
			<button type="submit" class="btn btn-primary">�α���</button>
		</form>
	</div>

</body>
</html>