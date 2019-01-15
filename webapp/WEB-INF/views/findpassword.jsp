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
table.findpassword_table {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	max-width: 100%;
}

tr td {
	padding-bottom: 15px;
}

td.findpasswordlist {
	text-align: center;
}

div.findpassword_main {
	position: absolute;
	top: 10%;
	left: 30%;
	width: 40%;
}
</style>
<title>��й�ȣ ã��</title>
</head>
<body>

	<jsp:include page="search_navbar.jsp"></jsp:include>
	<div class="findpassword_main"
		style="margin: 100px; text-align: center">
		<h2>��й�ȣ ã��</h2>
		<hr>
		<form action="findpassword.do" method="post">
			<table class="findpasswordlist">
				<tr>
					<td class="findpasswordlist">
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
						</div>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								name="email" placeholder="example@example.com">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<%
							if (request.getAttribute("password") != null) {
						%> <%=request.getAttribute("password")%> <%
 	}
 %>
					</td>
				</tr>
			</table>
			<input type="submit" class="btn100 rounded" value="��й�ȣã��" /> <a
				href="loginform.do" class="btn_a100 rounded">�α���������</a>
		</form>
	</div>
</body>
</html>