<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 18px;
    font-family: Arial, Helvetica, sans-serif;
    color: #333;
    line-height: 1.5rem;
}

body {
    background-color: #fff;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;

}

main {
    display: flex;
    flex-direction: column;
}

header{
 margin-top: 1rem;
}

.droparea {
    margin: 1rem auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 384px;
    max-width: 100%;
    height: 160px;
    border: 4px dashed grey;
    border-radius: 15px;
}

.droparea i {
    font-size: 3rem;
    flex-grow: 1;
    padding-top: 1rem;
}

.green-border {
    border-color: green;
} 
</style>

</head>
<body>
	<main>
		<section class="droparea">
			<i class="far fa-images"></i>
			<p>png나 jpg 파일 드랍하세요</p>
			<p><small>최대 10메가 </small></p>
		</section>
	</main>
<script>
const initApp = () => {
    const droparea = document.querySelector('.droparea');
  
    const active = () => droparea.classList.add("green-border");
    const inactive = () => droparea.classList.remove("green-border");
    const prevents = (e) => e.preventDefault();

    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(evtName => {
        droparea.addEventListener(evtName, prevents);
    });

    ['dragenter', 'dragover'].forEach(evtName => {
        droparea.addEventListener(evtName, active);
    });

    ['dragleave', 'drop'].forEach(evtName => {
        droparea.addEventListener(evtName, inactive);
    });
    
    droparea.addEventListener("drop", handleDrop);
}
document.addEventListener("DOMContentLoaded", initApp);

const handleDrop = (e) => {
  const dt = e.dataTransfer;
  const files = dt.files;
  const fileArray = [...files];
  console.log(files);
  console.log(fileArray);
};
initApp();
</script>
</body>
</html>