<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<h1>Edit Form</h1>
<form action="../editok" method="post">
<input type="hidden" name="seq" value="${u.seq}"/>
<table>
<tr><td>Category:</td><td><input type="text" name="category" value="${u.category}" /></td></tr>
<tr><td>Title:</td><td><input type="text" name="title" value="${u.title}"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="${u.writer}" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content">${u.content}</textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>