window.onload = function() {
	var login = document.getElementById("login");
	var register = document.getElementById("register");
	var main_login = document.getElementById("main_login");
	var main_register = document.getElementById("main_register");
	// 点击登录
	login.onclick = function() {
		const className = "current";
		const el_l = this;
		const el_r = register;
		const flag = addClass(el_l, className);
		if (flag) {
			removeClass(el_r, className);
		}
		main_login.style.display = "block";
		main_register.style.display = "none";
	};
	// 点击注册
	register.onclick = function() {
		const className = "current";
		const el_l = login;
		const el_r = this;
		const flag = addClass(el_r, className);
		if (flag) {
			removeClass(el_l, className);
		}
		main_login.style.display = "none";
		main_register.style.display = "block";
	}

	// 记住密码
	var oForm = document.getElementById('loginForm');
	var oUser = document.getElementById('user');
	var oPswd = document.getElementById('pswd');
	var oRemember = document.getElementById('remember');
	// 页面初始化时，如果帐号密码cookie存在则填充
	if (getCookie('user') && getCookie('pswd')) {
		oUser.value = getCookie('user');
		oPswd.value = getCookie('pswd');
		oRemember.checked = true;
	}
	// 复选框勾选状态发生改变时，如果未勾选则清除cookie
	oRemember.onchange = function() {
		if (!this.checked) {
			delCookie('user');
			delCookie('pswd');
		}
	};
	// 表单提交事件触发时，如果复选框是勾选状态则保存cookie
	oForm.onsubmit = function() {
		if (remember.checked) {
			setCookie('user', oUser.value, 7); // 保存帐号到cookie，有效期7天
			setCookie('pswd', oPswd.value, 7); // 保存密码到cookie，有效期7天
		}
	};
	// 设置cookie
	function setCookie(name, value, day) {
		var date = new Date();
		date.setDate(date.getDate() + day);
		document.cookie = name + '=' + value + ';expires=' + date;
	}
	;
	// 获取cookie
	function getCookie(name) {
		var reg = RegExp(name + '=([^;]+)');
		var arr = document.cookie.match(reg);
		if (arr) {
			return arr[1];
		} else {
			return '';
		}
	}
	;
	// 删除cookie
	function delCookie(name) {
		setCookie(name, null, -1);
	}
	;
	// 登录结果反馈
	var msg = document.getElementById('msg');
	if ((msg.innerText) !== "") {
		msg.style.display="block";
		msg.innerText = msg.innerText;
		setTimeout(function(){
			msg.style.display="none";
		},5000)
	}
};

// 判断当前dom是否已经包含了要添加的类
function hasClass(el, className) {
	let reg = new RegExp('(^|\\s)' + className + '(\\s|$)');
	return reg.test(el.className);
}

// 动态添加class
function addClass(el, className) {
	if (hasClass(el, className)) {
		return false;
	}
	// 将原有的class按空格拆分，并将类名保存到newclass数组中
	let newClass = el.className.split(' ');
	// 将要添加的类也push到这个数组
	newClass.push(className);
	// 将数组拼接成字符串返回给dom
	el.className = newClass.join(' ');
	return true;
}

// 动态移除class
function removeClass(el, className) {
	if (!hasClass(el, className)) {
		return false;
	}
	// 将原有的class按空格拆分，并将类名保存到newclass数组中
	let newClass = el.className.split(' ');
	// 将要添加的类从这个数组中移除
	newClass.pop(className);
	// 将数组拼接成字符串返回给dom
	el.className = newClass.join(' ');
	return true
}