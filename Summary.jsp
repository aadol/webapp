<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paper Folding Test</title>
</head>
<body>
<%
	//Calculate score of the second set
	int[] solution = {3,2,1,5,2,1,5,4,4,3};
	String[] answerList = {"P11answer","P12answer","P13answer","P14answer","P15answer","P16answer","P17answer","P18answer","P19answer","P20answer"};
	Double runningScore = 0.0;
	
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
	Double firstSetScore = Double.parseDouble((String)session.getAttribute("firstSetScore").toString());
	Double totalScore = firstSetScore + runningScore;
	out.print("Your Score: " + totalScore);
%>
</body>
</html>