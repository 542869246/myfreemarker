<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${htmlName}</title>
<style type="text/css">

</style>
</head>
<body>
	<h3>${htmlName }</h3>
	<h4>${helloWorld }</h4>
	<hr style='color: #eee' />
	字符串输出:
	<br /> ${"Hello ${name} !"} / ${"Hello " + name + " !"} 
	<#assign cname=r"特殊字符完成输出(http:\www.baidu.com)">
	<br />${name}
	<br/>
	<br />字符串截取 ：
	<br />通过下标直接获取下标对应的字母： ${name[2]}
	<br />起点下标..结尾下标截取字符串：${name[0..5]}
	<br />
	<br />算数运算：
	<#-- 支持"+"、"－"、"*"、"/"、"%"运算符 -->
	<#assign number1=10 number2=5 >
	<br />"+":${number1 + number2 }
	<br />"-":${number1 - number2 }
	<br />"*":${number1 * number2 }
	<br />"/":${number1 / number2 }
	<br />"%":${number1 % number2 }
	<br />
	<br />比较运算符：
	<br/>
	<#if number1 + number2 gte 16>
		number1+number2 大于等于 16
		<#elseif number1 + number2 == 15>
		number1+number2 等于 15
		<#elseif number1 + number2 lt 15>
		number1+number2 小于 15
	</#if>
	<br />
	<br />三元运算符：
	<br />
	${(users?size gt 15)?string('a','b') }
	<br />
	<br />内建函数：
	<#assign data = "abcd1234">
	<br />第一个字母大写：${data?cap_first}
	<br />所有字母小写：${data?lower_case}
	<br />所有字母大写：${data?upper_case}
	<#assign floatData = 12.34>
	<br />数值取整数：${floatData?int}
	<br />获取集合的长度：${users?size}
	<br />时间格式化：${dateTime?string("yyyy-MM-dd hh:mm:ss")}
	<br/>
	<br />空判断和对象集合(根据年龄降序)：
	<table border="1" cellspacing="0" cellpadding="3">
		<tr>
			<td align='center' colspan="4" style='background-color: #FFA500;'>用户列表</td>
		</tr> 4
		<tr align='center' style='background-color: #FFF68F;'>
				<td width='50'>序号</td>
				<td width='60'>用户编号</td>
				<td width='60'>年龄</td>
				<td width='100'>姓名</td>
		</tr>
	<#if users?? && users?size gt 0>
	<#list users?sort_by("age")?reverse as user>
		<#if user??>
			
			<tr align='center' <#if user_index%2==0>
									style='background-color: #FF6347;'
								<#else>
									style='background-color: #FFD39B;'
								</#if>>
				<td>${user_index+1}</td>			
				<td>${user.id!"null"}</td>
				<td>${user.age!"null"}</td>
				<td>${user.name!"null"}</td>
			</tr>
		<#else>
			<tr align='center'>
				<td>null</td>
				<td>null</td>
				<td>null</td>
			</tr>
		</#if>
	</#list>
	</table>
	<#else>
		<tr align='center'>
			<td colspan="4" style='background-color: #EEEE00;'>无数据</td>
		</tr>
		
	</#if>
	
	<br />
	
</body>
<script type="text/javascript">
	
</script>
</html>