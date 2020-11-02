function leavePass() {
    document.getElementById("MainContent_txtHash").value = CryptoJS.MD5(document.getElementById("txtAccess").value);
}

function leaveEmail() {
    document.getElementById("MainContent_txtEmail").value = document.getElementById("txtUser").value;
}

function validatePassword() {
    if ((document.getElementById("txtAccess").value == document.getElementById("txtVerification").value)
     && document.getElementById("txtAccess").value != ""
     && document.getElementById("txtVerification").value != "") {
        document.getElementById("MainContent_btnSave").removeAttribute("disabled");
        document.getElementById("MainContent_btnSave").removeAttribute("class");
        document.getElementById("txtAccess").removeAttribute("class");
        document.getElementById("txtVerification").removeAttribute("class");
    } else {
        if (!document.getElementById("MainContent_btnSave").hasAttribute("disabled")) {
            document.getElementById("MainContent_btnSave").setAttribute("disabled", "disabled");
            document.getElementById("MainContent_btnSave").setAttribute("class", "aspNetDisabled");
        }
        document.getElementById("txtAccess").setAttribute("class", "redBorder");
        document.getElementById("txtVerification").setAttribute("class", "redBorder");
    }
}