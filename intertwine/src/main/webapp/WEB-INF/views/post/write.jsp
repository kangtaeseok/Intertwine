<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/4b2098cb2a.js"></script>
	<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
	<c:import url="/WEB-INF/views/common/common.jsp"></c:import> 
<!-- 폰트어썸 가져오기 -->
</head>
<style>

.middle form {
display: flex; 
flex-wrap: wrap; 
}


#confirmTag, #cancelTag, #tagSettings,
.icons button,
.icons input[type="reset"],
.icons input[type="submit"] {
background-color: plum;
color: white; /* White text */
border: none; /* Remove default border */
padding: 10px 20px;
border-radius: 5px;
margin-left: 10px;
cursor: pointer;

</style>

<!-- 사진 업로드 코드 -->
<style>
    li {
      list-style: none;
    }

    img {
      width: 70px;
      height: 70px;
    }

    .real-upload {
      display: none;
    }

    .image-preview {
      width: 550px;
      background-color: grey;
      display: flex;
      gap: 20px;
    }

  </style>
<body>

<main>
<c:import url="/WEB-INF/views/common/menubar.jsp"></c:import> 
    <div class="container-write" style="margin: 0 auto;  padding-left: 250px; width: 800px;">
        <form id ="postFrom" action="posting.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
            <div class="top" style="max-width: 550px;position: relative;margin: auto;">
                <ul class="image-preview"></ul>
            </div>
            <div class="middle" style="padding-top: 10px;display: flex; flex-wrap: wrap;">
                <input type="file" name="files" class="real-upload" accept="image/*, video/mp4" multiple>
                <div class="upload" style="color: plum;font-size: 24px;cursor: pointer;"><i class="fa-solid fa-photo-film" fill="plum"style="color: plum;font-size: 24px;cursor: pointer;"></i>사진 업로드</div>
 <script>
    let trackedFiles = [];
    
    function getImageFiles(e) {
        const files = e.currentTarget.files;
        const imagePreview = document.querySelector('.image-preview');
        imagePreview.innerHTML = ''; 
        trackedFiles = []; 

        const selectedFiles = [...files];
        if (selectedFiles.some(file => file.type === 'video/mp4')) {
            if (selectedFiles.length > 1) {
                alert('동영상은 하나만 첨부 가능합니다.');
                return;
            }
        } else if (selectedFiles.length > 3) {
            alert('이미지는 3개까지 첨부 가능합니다.');
            return;
        }

        selectedFiles.forEach((file, index) => {
            if (!file.type.match("image/*") && file.type !== 'video/mp4') {
                alert('오직 이미지와 동영상만 첨부 가능합니다.');
                return;
            }

            const reader = new FileReader();
            reader.onload = (e) => {
                const preview = createElement(e, file, index); // 인덱스 
                imagePreview.appendChild(preview);
            };
            reader.readAsDataURL(file);
            trackedFiles.push(file); //어레이에 파일첨부
        });
    }
    
    function createElement(e, file, index) {
        const li = document.createElement('li');
        li.style.position = 'relative';

        let mediaElement;
        if (file.type.match("image/*")) {
            mediaElement = document.createElement('img');
            mediaElement.setAttribute('src', e.target.result);
        } else if (file.type === 'video/mp4') {
            mediaElement = document.createElement('video');
            mediaElement.setAttribute('src', e.target.result);
            mediaElement.setAttribute('controls', 'true');
            mediaElement.style.maxWidth = '100%';
            mediaElement.style.maxHeight = '200px';
        }

        mediaElement.setAttribute('data-file', file.name);
        li.appendChild(mediaElement);

        const deleteBtn = document.createElement('span');
        deleteBtn.textContent = 'X';
        deleteBtn.style.position = 'absolute';
        deleteBtn.style.color = 'plum';
        deleteBtn.style.top = '0';
        deleteBtn.style.right = '0';
        deleteBtn.style.cursor = 'pointer';
        deleteBtn.onclick = function() {
            li.remove();
            trackedFiles = trackedFiles.filter((_, fileIndex) => fileIndex !== index);
        };
        li.appendChild(deleteBtn);

        return li;
    }
    
    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');
    upload.addEventListener('click', () => realUpload.click());
    realUpload.addEventListener('change', getImageFiles);

    function submitFormData() {
       
        let formData = new FormData(); 

        trackedFiles.forEach(file => {
            formData.append('files', file);
        });

        fetch('posting.do', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => console.log('업로드 성공', data))
        .catch(error => console.error('에러:', error));
    }
  
</script>
                
                    
                <div class="dummy" style="display: flex; margin-right: auto;">
                </div>
                <div class="icons" style="display: flex;justify-content: flex-end;display: flex;justify-content: flex-end;padding-bottom: 10px;">
                    <button id="saveDraft" return="false">임시저장</button>
                    <input type="reset" value="취소">
                    <input type="submit" value="게시">
                </div>
                <div class="text" style="">
                    <textarea class="detail" name="postContent" placeholder="내용을 입력하세요" style="width: 545px;min-height: 100px;resize: none;"></textarea>
                </div>  
            </div>
            <div class="bottom">
<div class="tag">
    <button id="tagSettings" return="false">태그 설정</button>
</div>
<div class="tags">
</div>
              <script>
              document.getElementById('tagSettings').addEventListener('click', function(event) {
            	    event.preventDefault(); // 폼 전송 방지
            	    var existingDialog = document.querySelector('.modal-content');
            	    if (existingDialog) {
            	        existingDialog.remove();
            	        return;
            	    }

            	    var dialogHTML = `<div class="modal-content" style="position: relative;">
            	                        <input type="text" id="newTagInput" placeholder="#새 태그">
            	                        <button id="confirmTag">확인</button>
            	                        <button id="cancelTag">취소</button>
            	                      </div>`;
            	    document.querySelector('.tag').insertAdjacentHTML('afterend', dialogHTML);

            	    document.getElementById('cancelTag').addEventListener('click', function(event) {
            	        event.preventDefault(); 
            	        document.querySelector('.modal-content').remove();
            	    });

            	    document.getElementById('confirmTag').addEventListener('click', function(event) {
            	        event.preventDefault(); 
            	        const input = document.getElementById('newTagInput');
            	        const tagValue = input.value.trim();
            	        if (!tagValue.startsWith('#')) {
            	            alert('태그는 #으로 시작해야 합니다.');
            	            return;
            	        }

            	        if (tagValue.includes(' ')) {
            	            alert('태그에는 공백이 포함될 수 없습니다.');
            	            return;
            	        }

            	        const existingTags = document.querySelectorAll('.tags div');
            	        for (let tag of existingTags) {
            	            if (tag.textContent === tagValue) {
            	                alert('이미 존재하는 태그입니다.');
            	                return;
            	            }
            	        }

            	        const uniqueId = tagValue.slice(1); // '#' 제거 후 유니크 아이디 부여

            	        // 페이지에 태그 삽입
            	        const tagContainer = document.createElement('div');
            	        tagContainer.setAttribute('id', uniqueId);
            	        tagContainer.textContent = tagValue;
            	        tagContainer.style.marginRight = '5px';

            	        // 삭제 버튼 추가
            	        const deleteButton = document.createElement('button');
            	        deleteButton.textContent = 'X';
            	        deleteButton.style.marginLeft = '5px';
            	        
            	        deleteButton.addEventListener('click', function(event) {
            	            event.preventDefault(); // 폼 전송 방지
            	            const tagId = this.parentNode.getAttribute('id');
            	            document.getElementById(tagId).remove(); // 태그 컨테이너 삭제
            	            document.getElementById('input-' + tagId).remove(); // 숨겨진 입력 삭제
            	        });
            	        tagContainer.appendChild(deleteButton);

            	        document.querySelector('.tags').appendChild(tagContainer);
            	        document.querySelector('.tags').appendChild(document.createTextNode(' ')); // 스페이싱 삽입

            	        document.querySelector('.modal-content').remove();
            	        input.value = ''; // 다이얼로그 비움

            	        // 숨겨진 input 삽입
            	        const hiddenInput = document.createElement('input');
            	        hiddenInput.type = 'hidden';
            	        hiddenInput.name = 'tagName';
            	        hiddenInput.setAttribute('id', 'input-' + uniqueId); // 입력 아이디는 태그 아이디와 연결
            	        hiddenInput.value = tagValue; // value값을 사용된 글자로 삽입
            	        document.querySelector('form').appendChild(hiddenInput);
            	    });
            	});
                </script>
              <div>
                <br>
                <b>프라이버시 설정</b>
              </div>
              <div class="settings">
                  <br>
                  이 게시글의 공개범위를 설정해주세요<br>
                  (계정이 비공개인 경우 각 포스트 설정과 무관하게 비공개 처리 됩니다)
                  <ul style="padding-left: 0px;">
                      <input type="radio" id="option1" name="postVisible" value="0" checked>
                      <label for="option1">전체공개</label><br>
                      <input type="radio" id="option2" name="postVisible" value="1">
                      <label for="option2">친구공개</label><br>
                      <input type="radio" id="option3" name="postVisible" value="2">
                      <label for="option3">비공개</label>
                  </ul>
              </div>
            </div>
        </form>
    </div>

<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
    </main>
</body>
<!-- 임시저장용 자바스크립트 완료 -->
<script>
	const form = document.querySelector('form');
    const saveButton = document.getElementById("saveDraft");
    const textArea = document.querySelector(".detail");
      
    saveButton.addEventListener("click", (event) => { 
        event.preventDefault(); 
        localStorage.setItem("textArea", textArea.value); 
        alert("임시저장되었습니다."); 
    });
  
    window.onload = () => {
        
        if (localStorage.getItem("textArea")) {
            
            if (confirm("최근 작성한 글을 불러오시겠습니까?")) {
                textArea.value = localStorage.getItem("textArea"); 
            } else {
                localStorage.removeItem("textArea");
            }
        }
    };
    form.addEventListener('submit', function(event) {

        localStorage.removeItem("textArea"); //임시저장은 게시버튼 누를 시 삭제
    });

</script>


