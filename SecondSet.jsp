<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paper Folding Test</title>
<script type="text/javascript">
var veryFirstDate = new Date().getTime();
var limitM = 3;
var limitS = 0;
var x = 
setInterval(function ()
{
	var now = new Date().getTime();
	var distance = now - veryFirstDate
	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    var secLeft = 0;
    var minLeft = 0;
    if(limitS < seconds)
   	{
   		limitS += 60;
   		limitM -= 1;
   	}
    secLeft = limitS - seconds;
    minLeft = limitM - minutes;
    document.getElementById("demo").innerHTML = minLeft + "m " + secLeft + "s ";
    if(((secLeft == 0)&&(minLeft == 0))||(minLeft<0))
   	{
   		document.getElementById("form2").submit();
   	}
}, 1000);
</script>
</head>
<body>
<h3>Paper Folding Test (Problem Set 2)</h3>
<form id="form2" name="form2" method="post" action="Summary.jsp">
<table border="1">
	<tr>
		<td colspan="2"><p align="center" id="demo" style="font-size:30px;"></p></td>
	</tr>
	<%
		for(int i=10;i<=19;i++)
		{
			out.print("<tr>");
			out.print("<td>");
			out.print("<img src='Images/Part1Problem" + (i+1) + "Q.jpg" + "'>");
			out.print("</td>");
			out.print("<td>");
			
			out.print("<table>");
			out.print("<tr>");
			for(int j=0;j<=4;j++)
			{
				out.print("<td>");
				out.print("<img src='Images/Part1Problem" + (i+1) + "Choice" + (j+1) + ".jpg'>");
				out.print("</td>");
			}
			out.print("</tr>");
			out.print("<tr>");
			for(int j=0;j<=4;j++)
			{
				out.print("<td>");
				out.print("<input type='radio' name='P" + (i+1) + "answer' value='" + (j+1) + "'>");
				out.print("</td>");
			}
			out.print("</tr>");
			out.print("</table>");
			
			out.print("</td>");
			out.print("</tr>");
		}
	%>
	<tr>
		<td colspan="2"><p align="center"><input type="submit" value="SUBMIT"></p></td>
	</tr>
</table>
</form>
<%
	//Calculate score of the first set and store value in session
	int[] solution = {1,4,2,4,2,5,1,3,5,5};
	String[] answerList = {"P1answer","P2answer","P3answer","P4answer","P5answer","P6answer","P7answer","P8answer","P9answer","P10answer"};
	double runningScore = 0.0;
	
	for(int i=0;i<solution.length;i++)
	{
		try
		{
			int answer = Integer.parseInt(request.getParameter(answerList[i]));
			if(answer == solution[i])
			{
				runningScore += 1.0;
			}
			else
			{
				runningScore -= 0.75;
			}
		}
		catch(NumberFormatException e)
		{
			runningScore += 0.0;
		}
	}
	session.setAttribute("firstSetScore",runningScore);
%>
</body>
</html>