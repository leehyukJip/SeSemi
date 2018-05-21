<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
ul{
	list-style:none;
}
label{
	margin-left: 10px;
	width: 70px;
	display: inline-block;
}
</style>
<div align="center" style="width: 100%; height: 70%; border: 1px thick black;">
<br>
<h3>이용약관</h3>
	<div align="left" style="width: 80%; height: 80%; border: 5px solid #244; overflow: auto;">
		■개인정보의 수집 및 이용<br><br>

	1. 개인정보의 수집ㆍ이용 목적<br>
 	⊙AS센터서비스 회원이 AS센터홈페이지 개인화서비스 이용을 목적으로 하는 경우 <br><br>

	2. 수집하려는 개인정보의 항목<br>
	 AS센터서비스는 회원가입 및 원활한 서비스 상담 등 기본적인 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
	 ⊙AS센터서비스 회원번호, 웹회원 아이디, 웹회원 비밀번호, 이름, AS센터서비스 가입센터, 핸드폰, 이메일 <br><br>

	3. 개인정보의 보유 및 이용 기간<br>
	 회원 이용자의 개인정보는 회원가입일로부터 탈퇴 시까지 보유 및 이용되며, 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 따라서 우리 센터은 정보주체의 회원탈퇴 요청 시 그 회원의 개인정보를 지체 없이 파기합니다.<br><br>

	4. 동의거부권 및 동의 거부에 따른 불이익<br>
 	가입자는 개인정보 수집 및 이용에 대하여 거부할 수 있는 권리가 있습니다. 단, 이에 대한 동의를 거부할 경우에는 회원가입이 불가능합니다<br><br>

	5. 정보주체의 권리<br>
	 AS센터서비스 회원은 자신의 개인정보 처리와 관련하여 아래와 같은 권리를 가집니다.<br>
 	⊙ 개인정보의 처리 여부를 확인하고 개인정보에 대하여 열람(사본의 발급을 포함한다. 이하 같다)을 요구할 권리<br>
 	⊙ 개인정보의 처리 정지, 정정·삭제 및 파기를 요구할 권리<br>
 	⊙ 개인정보의 처리로 인하여 발생한 피해를 신속하고 공정한 절차에 따라 구제받을 권리<br>
 	이용자 분들의 개인정보 보호를 위해 「개인정보보호법」을 준수하고 있습니다.<br>
	</div>
</div>
<form >
	<fieldset>
		<legend>회원가입</legend>
		<ul>
			<li>
				<label for="id">ID</label>
				<input type="text" name="id"> 
				<input type="button" value="ID 중복체크">
			</li>
			<li>
				<label for="pw">PW</label>
				<input type="password" name="pw"> 
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name"> 
			</li>
			<li>
				<label for="adress">주소</label>
				<input type="text" name="adress"> 
			</li>
			<li>
				<label for="phone">전화번호</label>
				<input type="tel" name="phone"> 
			</li>
			<li>
				<label>　</label>
				<button>가입</button>
			</li>
		</ul>
	</fieldset>

</form>