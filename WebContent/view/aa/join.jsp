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
<h3>�̿���</h3>
	<div align="left" style="width: 80%; height: 80%; border: 5px solid #244; overflow: auto;">
		�ᰳ�������� ���� �� �̿�<br><br>

	1. ���������� �������̿� ����<br>
 	��AS���ͼ��� ȸ���� AS����Ȩ������ ����ȭ���� �̿��� �������� �ϴ� ��� <br><br>

	2. �����Ϸ��� ���������� �׸�<br>
	 AS���ͼ��񽺴� ȸ������ �� ��Ȱ�� ���� ��� �� �⺻���� ���� ������ ���� �Ʒ��� ���� ���������� �����ϰ� �ֽ��ϴ�.<br>
	 ��AS���ͼ��� ȸ����ȣ, ��ȸ�� ���̵�, ��ȸ�� ��й�ȣ, �̸�, AS���ͼ��� ���Լ���, �ڵ���, �̸��� <br><br>

	3. ���������� ���� �� �̿� �Ⱓ<br>
	 ȸ�� �̿����� ���������� ȸ�������Ϸκ��� Ż�� �ñ��� ���� �� �̿�Ǹ�, ��Ģ������ ���������� ���� �� �̿������ �޼��Ǹ� ��ü ���� �ı��մϴ�. ���� �츮 ������ ������ü�� ȸ��Ż�� ��û �� �� ȸ���� ���������� ��ü ���� �ı��մϴ�.<br><br>

	4. ���ǰźα� �� ���� �źο� ���� ������<br>
 	�����ڴ� �������� ���� �� �̿뿡 ���Ͽ� �ź��� �� �ִ� �Ǹ��� �ֽ��ϴ�. ��, �̿� ���� ���Ǹ� �ź��� ��쿡�� ȸ�������� �Ұ����մϴ�<br><br>

	5. ������ü�� �Ǹ�<br>
	 AS���ͼ��� ȸ���� �ڽ��� �������� ó���� �����Ͽ� �Ʒ��� ���� �Ǹ��� �����ϴ�.<br>
 	�� ���������� ó�� ���θ� Ȯ���ϰ� ���������� ���Ͽ� ����(�纻�� �߱��� �����Ѵ�. ���� ����)�� �䱸�� �Ǹ�<br>
 	�� ���������� ó�� ����, ���������� �� �ı⸦ �䱸�� �Ǹ�<br>
 	�� ���������� ó���� ���Ͽ� �߻��� ���ظ� �ż��ϰ� ������ ������ ���� �������� �Ǹ�<br>
 	�̿��� �е��� �������� ��ȣ�� ���� ������������ȣ������ �ؼ��ϰ� �ֽ��ϴ�.<br>
	</div>
</div>
<form >
	<fieldset>
		<legend>ȸ������</legend>
		<ul>
			<li>
				<label for="id">ID</label>
				<input type="text" name="id"> 
				<input type="button" value="ID �ߺ�üũ">
			</li>
			<li>
				<label for="pw">PW</label>
				<input type="password" name="pw"> 
			</li>
			<li>
				<label for="name">�̸�</label>
				<input type="text" name="name"> 
			</li>
			<li>
				<label for="adress">�ּ�</label>
				<input type="text" name="adress"> 
			</li>
			<li>
				<label for="phone">��ȭ��ȣ</label>
				<input type="tel" name="phone"> 
			</li>
			<li>
				<label>��</label>
				<button>����</button>
			</li>
		</ul>
	</fieldset>

</form>