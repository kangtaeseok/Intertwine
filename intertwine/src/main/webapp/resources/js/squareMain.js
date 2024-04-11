document.querySelector('.homebutton').addEventListener('click', function () {
  // 홈 버튼을 클릭했을 때 실행할 동작을 여기에 작성합니다.
  // 예를 들어, 홈 페이지로 이동하는 코드 등을 작성할 수 있습니다.
  window.location.href = '#'; // 홈 페이지로 이동하는 예시
});

// jQuery를 사용하여 미디어 쿼리를 적용
$(document).ready(function () {
  var originalContents = {  // 원래 속성을 변수에 저장
      square: '<a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>',
      mypage: '<a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>',
      friend: '<a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>',
      chatting: '<a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>',
      alarm: '<a href="#"><i class="fa-solid fa-bell"></i> 알림</a>',
      bookmark: '<a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>',
      settings: '<a href="#"><i class="fa-solid fa-gear"></i> 설정</a>'
  };

  // 페이지 크기가 1279px 이하일 때 '스퀘어' 텍스트를 지우고 아이콘만 남깁니다.
  /*  JavaScript 코드와 CSS의 미디어 쿼리 사이에 일치하지 않는 부분이 있을 수 있습니다. 이는 화면 너비를 검사하는 방식의 차이 때문에 발생할 수 있습니다. 조정이 필요할 수 있습니다.*/
  if ($(window).width() <= 1262) {
      // 사이드 바 메뉴 아이콘 변경
      $('.side-bar > ul > li > a').each(function () {
          // 해당 메뉴의 아이콘 클래스를 가져와서 변경
          var iconClass = $(this).children('i').attr('class');
          $(this).html('<i class="' + iconClass + '"></i>');
      });

      mypage.addEventListener('click', function () {
          let isOn2 = mypage_sub_menu.classList.contains("on");

          if (isOn2) {
              mypage_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              mypage_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              mypage_sub_menu.style.left = "75px";

          }
      });

      chatting.addEventListener('click', function () {
          let isOn2 = chatting_sub_menu.classList.contains("on");

          if (isOn2) {
              chatting_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              chatting_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              chatting_sub_menu.style.left = "75px";
          }
      });

      alarm.addEventListener('click', function () {
          let isOn2 = alarm_sub_menu.classList.contains("on");

          if (isOn2) {
              alarm_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              alarm_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              alarm_sub_menu.style.left = "75px";
          }
      });

      settings.addEventListener('click', function () {
          let isOn2 = settings_sub_menu.classList.contains("on");

          if (isOn2) {
              settings_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              settings_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              settings_sub_menu.style.left = "75px";
          }
      });

  } else {
      // 페이지 크기가 축소되지 않으면 아이콘을 원래 텍스트로 변경
      $('.side-bar > ul > li > a').each(function () {
          var originalText = $(this).parent().attr('original-text');
          $(this).html(originalText);
      });


      mypage.addEventListener('click', function () {
          let isOn2 = mypage_sub_menu.classList.contains("on");

          if (isOn2) {
              mypage_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              mypage_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              mypage_sub_menu.style.left = "240px";

          }
      });

      chatting.addEventListener('click', function () {
          let isOn2 = chatting_sub_menu.classList.contains("on");

          if (isOn2) {
              chatting_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              chatting_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              chatting_sub_menu.style.left = "240px";
          }
      });

      alarm.addEventListener('click', function () {
          let isOn2 = alarm_sub_menu.classList.contains("on");

          if (isOn2) {
              alarm_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              alarm_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              alarm_sub_menu.style.left = "240px";
          }
      });

      settings.addEventListener('click', function () {
          let isOn2 = settings_sub_menu.classList.contains("on");

          if (isOn2) {
              settings_sub_menu.classList.remove("on");
              dummy_sub_menu.classList.remove("on");
          } else {
              // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
              $(".sub_menu.on").removeClass("on").css("left", "-100%");
              settings_sub_menu.classList.add("on");
              dummy_sub_menu.classList.add("on");
              settings_sub_menu.style.left = "240px";
          }
      });
  }

  $(window).resize(function () {
      if ($(window).width() <= 1262) {
          $('.side-bar > ul > li#square > a').each(function () {
              $(this).html('<i class="fa-solid fa-gamepad"></i>');
          });
          $('.side-bar > ul > li#mypage > a').each(function () {
              $(this).html('<i class="fa-solid fa-circle-user"></i>');
          });
          $('.side-bar > ul > li#friend > a').each(function () {
              $(this).html('<i class="fa-solid fa-user-group"></i>');
          });
          $('.side-bar > ul > li#chatting > a').each(function () {
              $(this).html('<i class="fa-solid fa-comment"></i>');
          });
          $('.side-bar > ul > li#alarm > a').each(function () {
              $(this).html('<i class="fa-solid fa-bell">');
          });
          $('.side-bar > ul > li#bookmark > a').each(function () {
              $(this).html('<i class="fa-solid fa-bookmark"></i>');
          });
          $('.side-bar > ul > li#settings > a').each(function () {
              $(this).html('<i class="fa-solid fa-gear"></i>');
          });
      } else {
          $('.side-bar > ul > li').each(function () {
              var id = $(this).attr('id');
              $(this).html(originalContents[id]);
          });
      }
  });
});
const content = document.querySelector("#bottom_right_contents");
const sidebarItems = document.querySelectorAll('.side-bar > ul > li');
const submenu = document.querySelector(".sub_menu");
const mypage = document.querySelector("#mypage");
const chatting = document.querySelector("#chatting");
const alarm = document.querySelector("#alarm");
const settings = document.querySelector("#settings");
const mypage_sub_menu = document.querySelector("#mypage_sub_menu");
const chatting_sub_menu = document.querySelector("#chatting_sub_menu");
const alarm_sub_menu = document.querySelector("#alarm_sub_menu");
const settings_sub_menu = document.querySelector("#settings_sub_menu");


$(document).ready(function () {
  // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
  $(window).resize(function () {
      if ($(window).width() > 1262) {
          // mypage_sub_menu의 left 값을 75px로 변경
          $('#mypage_sub_menu').css('left', '240px');
          $('#chatting_sub_menu').css('left', '240px');
          $('#alarm_sub_menu').css('left', '240px');
          $('#settings_sub_menu').css('left', '240px');
      }
  });

  // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
  $(window).resize(function () {
      if ($(window).width() <= 1262) {
          // mypage_sub_menu의 left 값을 75px로 변경
          $('#mypage_sub_menu').css('left', '75px');
          $('#chatting_sub_menu').css('left', '75px');
          $('#alarm_sub_menu').css('left', '75px');
          $('#settings_sub_menu').css('left', '75px');
      }
  });

  // 화면 크기가 1279px 이하일 때 서브메뉴의 위치 변경
  if ($(window).width() > 1262) {
      // mypage_sub_menu의 left 값을 75px로 변경
      $('#mypage_sub_menu').css('left', '240px');
      $('#chatting_sub_menu').css('left', '240px');
      $('#alarm_sub_menu').css('left', '240px');
      $('#settings_sub_menu').css('left', '240px');
  }


  // 화면 크기가 1279px 이하일 때 서브메뉴의 위치 변경
  if ($(window).width() <= 1262) {
      // mypage_sub_menu의 left 값을 75px로 변경
      $('#mypage_sub_menu').css('left', '75px');
      $('#chatting_sub_menu').css('left', '75px');
      $('#alarm_sub_menu').css('left', '75px');
      $('#settings_sub_menu').css('left', '75px');
  }


});

$(function () {
  var screenWidth = $(window).width();

  if (screenWidth > 1262) {
      // 화면 너비가 768px보다 작을 때 실행할 코드
      $('#mypage_sub_menu').css('left', '240px');
      $('#chatting_sub_menu').css('left', '240px');
      $('#alarm_sub_menu').css('left', '240px');
      $('#settings_sub_menu').css('left', '240px');
  } else if (screenWidth >= 768 && screenWidth <= 1262) {
      // 화면 너비가 768px 이상이고 1024px보다 작을 때 실행할 코드
      $('#mypage_sub_menu').css('left', '75px');
      $('#chatting_sub_menu').css('left', '75px');
      $('#alarm_sub_menu').css('left', '75px');
      $('#settings_sub_menu').css('left', '75px');
  } else {
      // 화면 너비가 1024px 이상일 때 실행할 코드
      console.log("큰 화면");
  }

});


$(document).ready(function () {
  // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
  $(window).resize(function () {
      if ($(window).width() > 1262) {
          // mypage_sub_menu의 left 값을 75px로 변경
          $('#mypage_sub_menu').css('left', '240px');
          $('#chatting_sub_menu').css('left', '240px');
          $('#alarm_sub_menu').css('left', '240px');
          $('#settings_sub_menu').css('left', '240px');
      } else {
          // mypage_sub_menu의 left 값을 240px로 변경
          $('#mypage_sub_menu').css('left', '75px');
          $('#chatting_sub_menu').css('left', '75px');
          $('#alarm_sub_menu').css('left', '75px');
          $('#settings_sub_menu').css('left', '75px');
      }
  });

  // 초기 로딩 시에도 한 번 실행하여 화면 크기에 따라 서브메뉴의 위치 조정
  if ($(window).width() > 1262) {
      // mypage_sub_menu의 left 값을 75px로 변경
      $('#mypage_sub_menu').css('left', '240px');
      $('#chatting_sub_menu').css('left', '240px');
      $('#alarm_sub_menu').css('left', '240px');
      $('#settings_sub_menu').css('left', '240px');
  } else {
      // mypage_sub_menu의 left 값을 240px로 변경
      $('#mypage_sub_menu').css('left', '75px');
      $('#chatting_sub_menu').css('left', '75px');
      $('#alarm_sub_menu').css('left', '75px');
      $('#settings_sub_menu').css('left', '75px');
  }
});

window.addEventListener('load', function () {
  // 최소 6초 후 로딩 이미지 숨김 처리
  setTimeout(function () {
      document.getElementById('loadingview').classList.add('hidden');
      document.getElementById('squaretip').classList.add('hidden');
  }, 6000); // 1000ms = 1초
});


(function () {

  document.addEventListener("keydown", function (e) {
      const character = document.getElementById("mycharacter");
      const room = document.getElementById("userroom");

      // `#userroom`의 크기와 위치를 얻음
      const roomRect = room.getBoundingClientRect();

      // `#mycharacter`의 현재 위치를 얻음
      let x = parseInt(character.style.left || 0, 10);
      let y = parseInt(character.style.top || 0, 10);

      // 키보드 입력에 따른 캐릭터의 이동 거리
      const step = 5;

      // 키 입력에 따라 x, y 위치 업데이트
      if (e.key === "ArrowLeft") { x -= step; }
      if (e.key === "ArrowRight") { x += step; }
      if (e.key === "ArrowUp") { y -= step; }
      if (e.key === "ArrowDown") { y += step; }

      // 캐릭터가 `#userroom` 영역 안에 있는지 확인
      // 캐릭터의 크기를 고려하지 않았음. 필요시 캐릭터 크기를 고려하여 조정
      if (x < 0) x = 0;
      if (x > roomRect.width - character.offsetWidth) x = roomRect.width - character.offsetWidth;
      if (y < 0) y = 0;
      if (y > roomRect.height - character.offsetHeight) y = roomRect.height - character.offsetHeight;

      // 업데이트된 위치를 적용
      character.style.left = x + "px";
      character.style.top = y + "px";
  });

})();

//버튼 가져온거 시작
var animateButton = function (e) {

  e.preventDefault;
  //reset animation
  e.target.classList.remove('animate');

  e.target.classList.add('animate');
  setTimeout(function () {
      e.target.classList.remove('animate');
  }, 700);
};

var bubblyButtons = document.getElementsByClassName("bubbly-button");

for (var i = 0; i < bubblyButtons.length; i++) {
  bubblyButtons[i].addEventListener('click', animateButton, false);
}
//버튼 가져온거 여기까지



const myCharacter = document.getElementById('mycharacter');

// 기존 동적 버튼들을 제거하는 함수
function removeDynamicButtons() {
  const existingButtons = myCharacter.querySelectorAll('.dynamic-btn');
  existingButtons.forEach(btn => btn.remove());
}

myCharacter.addEventListener('contextmenu', function (event) {
  event.preventDefault(); // 기본 컨텍스트 메뉴 방지

  // 기존에 있던 동적 버튼들 제거
  removeDynamicButtons();

  // 버튼 생성 함수
  function createButton(text, dataBsTarget, offsetY) {
      const button = document.createElement('button');
      button.type = 'button';
      button.className = 'btn dynamic-btn';
      button.setAttribute('data-bs-toggle', 'modal');
      button.setAttribute('data-bs-target', dataBsTarget);
      button.textContent = text;

      // #mycharacter에 대한 상대적 위치 계산
      const rect = myCharacter.getBoundingClientRect();
      button.style.left = `${event.clientX - rect.left}px`;
      button.style.top = `${event.clientY - rect.top + offsetY}px`;

      return button;
  }

  // "닉네임 수정" 버튼 생성 및 추가
  const changeNicknameButton = createButton('닉네임 수정', '#nicknameModal', 0);
  changeNicknameButton.id = 'changeNicknameButton'; // id 속성 추가
  changeNicknameButton.setAttribute('data-bs-toggle', 'modal'); // Bootstrap 모달 트리거 속성 추가
  changeNicknameButton.setAttribute('data-bs-target', '#nicknameModal'); // 타겟 모달의 ID 지정
  myCharacter.appendChild(changeNicknameButton);
  changeNicknameButton.addEventListener('click', function (event) {
      const modal = document.querySelector("#nicknameChangeModal");
      modal.style.display = "flex";
  });

  // "캐릭터 수정" 버튼 생성 및 위치 조정
  const buttonHeight = 30; // 실제 높이에 따라 조절
  const changeCharacterButton = createButton('캐릭터 수정', '#exampleModal2', buttonHeight);
  changeCharacterButton.id = 'changeCharacterButton'; // id 속성 추가
  const currentTop = parseInt(changeCharacterButton.style.top, 10);
  changeCharacterButton.style.top = `${currentTop - 6}px`;
  myCharacter.appendChild(changeCharacterButton);

  $("#changeCharacterButton").click(function () {
      console.log("캐릭터 수정 버튼 클릭!");
      const modal = document.querySelector("#characterChangeModal");
      modal.style.display = "flex";

      $.ajax({
          url: "getcharacterreosource.do",
          type: "post",
          data: { "userId": window.globaluserId },
          dataType: "json",
          success: function (data) {
              var hairList = data.hairjarr; // 컨트롤러에서 보낸 hairjarr 사용
              var hatList = data.hatjarr; // 컨트롤러에서 보낸 hairjarr 사용
              var topList = data.topjarr; // 컨트롤러에서 보낸 hairjarr 사용
              var bottomList = data.bottomjarr; // 컨트롤러에서 보낸 hairjarr 사용

              const previewcharacterhair = document.querySelector("#previewcharacterhair");
              previewcharacterhair.style.backgroundImage = "url('" + data.mycharacter.hairStyleImageURL + "')";
              previewcharacterhair.style.backgroundSize = "cover";
              previewcharacterhair.style.backgroundPosition = "center";
              const previewcharacterhat = document.querySelector("#previewcharacterhat");
              previewcharacterhat.style.backgroundImage = "url('" + data.mycharacter.hatImageURL + "')";
              previewcharacterhat.style.backgroundSize = "cover";
              previewcharacterhat.style.backgroundPosition = "center";
              const previewcharactertop = document.querySelector("#previewcharactertop");
              previewcharactertop.style.backgroundImage = "url('" + data.mycharacter.topImageURL + "')";
              previewcharactertop.style.backgroundSize = "cover";
              previewcharactertop.style.backgroundPosition = "center";
              const previewcharacterbottom = document.querySelector("#previewcharacterbottom");
              previewcharacterbottom.style.backgroundImage = "url('" + data.mycharacter.bottomImageURL + "')";
              previewcharacterbottom.style.backgroundSize = "cover";
              previewcharacterbottom.style.backgroundPosition = "center";

              // .charactermodal-hair-container의 자식 div를 모두 찾음
              var hairDivs = document.querySelectorAll('.charactermodal-hair-container > div');
              // .charactermodal-hat-container의 자식 div를 모두 찾음
              var hatDivs = document.querySelectorAll('.charactermodal-hat-container > div');
              // .charactermodal-top-container의 자식 div를 모두 찾음
              var topDivs = document.querySelectorAll('.charactermodal-top-container > div');
              // .charactermodal-bottom-container의 자식 div를 모두 찾음
              var bottomDivs = document.querySelectorAll('.charactermodal-bottom-container > div');

              // hairList의 각 항목에 대해 반복
              hairList.forEach(function (hair, index) {
                  // 존재하는 div 수 내에서만 실행
                  if (index < hairDivs.length) {
                      var $div = $(hairDivs[index]); // jQuery 객체로 변환
                      $div.data('hairId', hair.hairId); // 데이터 설정
                      $div.data('index', index); // 인덱스 설정
                      // 각 div의 배경 이미지 설정
                      $div.css('background-image', 'url(' + hair.hairImageURL + ')');
                  }
              });

              // hatList의 각 항목에 대해 반복
              hatList.forEach(function (hat, index) {
                  // 존재하는 div 수 내에서만 실행
                  if (index < hatDivs.length) {
                      var $div = $(hatDivs[index]); // jQuery 객체로 변환
                      $div.data('hatId', hat.hatId); // 데이터 설정
                      $div.data('index', index); // 인덱스 설정
                      // 각 div의 배경 이미지 설정
                      $div.css('background-image', 'url(' + hat.hatImageURL + ')');
                  }
              });

              // topList의 각 항목에 대해 반복
              topList.forEach(function (top, index) {
                  // 존재하는 div 수 내에서만 실행
                  if (index < topDivs.length) {
                      var $div = $(topDivs[index]); // jQuery 객체로 변환
                      $div.data('topId', top.topId); // 데이터 설정
                      $div.data('index', index); // 인덱스 설정
                      // 각 div의 배경 이미지 설정
                      $div.css('background-image', 'url(' + top.topImageURL + ')');
                  }
              });

              // bottomList의 각 항목에 대해 반복
              bottomList.forEach(function (bottom, index) {
                  // 존재하는 div 수 내에서만 실행
                  if (index < bottomDivs.length) {
                      var $div = $(bottomDivs[index]); // jQuery 객체로 변환
                      $div.data('bottomId', bottom.bottomId); // 데이터 설정
                      $div.data('index', index); // 인덱스 설정
                      // 각 div의 배경 이미지 설정
                      $div.css('background-image', 'url(' + bottom.bottomImageURL + ')');
                  }
              });


          },
          error: function (request, status, errorData) {
              console.log("error code : " + request.status
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
          }
      });  // ajax

  });

  // 친구 목록 버튼 생성 및 위치 조정
  const friendListButton = createButton('친구 목록', '#exampleModal3', 2 * (buttonHeight));
  friendListButton.id = 'friendListButton'; // id 속성 추가
  const currentTop2 = parseInt(friendListButton.style.top, 10);
  friendListButton.style.top = `${currentTop2 - 12}px`;
  myCharacter.appendChild(friendListButton);

  friendListButton.addEventListener('click', function (event) {
      console.log("친구목록버튼클릭!");
      const modal = document.querySelector("#friendListModal");
      modal.style.display = "flex";
      var $friendModalList = $('.friendmodal-list');
      $friendModalList.empty();

      $.ajax({
          url: "getfriendlist.do",
          type: "POST",
          data: { "userId": window.globaluserId },
          dataType: "json",
          success: function (data) {
              console.log("success!");
              var friends = data.friends;

              $.each(friends, function (index, friend) {
                  var friendDiv = $("<div>", { class: "friend-info", "data-friend-id": friend.friendId }).css({
                      display: "flex",
                      alignItems: "center",
                      marginBottom: "10px",
                  }).click(function () {
                      // 모든 friend-info에서 selected 클래스 제거
                      $(".friend-info").removeClass("selected-friend");
                      // 클릭된 friend-info에만 selected 클래스 추가
                      $(this).addClass("selected-friend");
                  });
        if(friend.profiledraft != null){
                  var profilePic = $("<img>", {
                      src: "/intertwine/" + friend.profiledraft,
                      alt: "Profile Picture",
                      width: "50px",
                      height: "50px",
                      css: {
                          borderRadius: "50%",
                          marginRight: "30px",
                      }
                  });
        } else {
        var profilePic = $("<img>", {
                      src: "/intertwine/resources/images/defaultProfile.png",
                      alt: "Profile Picture",
                      width: "50px",
                      height: "50px",
                      css: {
                          borderRadius: "50%",
                          marginRight: "30px",
                      }
                  });
        }
                  var nickname = $("<div>").text(friend.friendId);

                  // 프로필 사진과 별명을 div에 추가
                  friendDiv.append(profilePic).append(nickname);

                  // 생성된 div를 페이지에 추가
                  $friendModalList.append(friendDiv);
              });

              // 이동 버튼 클릭 이벤트 추가
              $("#gofirendroombtn").off("click").on("click", function () {
                  var selectedFriendId = $(".selected-friend").data("friend-id");
                  if (selectedFriendId) {
                      $.ajax({
                          url: "movetofriendroom.do",
                          type: "POST",
                          data: { "friendId": selectedFriendId },
                          dataType: "json", // 이 설정으로 인해 response는 이미 JSON 객체입니다.
                          success: function(response) {
                console.log("Room Move Success!", response);
                if (!$.isEmptyObject(response) && response.userId) {
                    var roomData = response;
                    roomHost = roomData.userId;
                    
                    
                    console.log("방 주인: " + roomHost);
                    console.log("방 색상: " + roomData.roomColor);
                    console.log("방명록 공개 여부: " + roomData.guestBookOpen);
            
                    // 기존의 .userroomresource 엘리먼트를 모두 제거
                    $(".userroomresource").remove();
            
                    // #userroom의 배경색 변경
                    $("#userroom").css("background-color", roomData.roomColor);
            
                    // rList가 비어있지 않다면 리소스를 페이지에 추가
                    if (roomData.rList && roomData.rList.length > 0) {
                        roomData.rList.forEach(function(resource) {
                            var imgElement = $('<img>', {
                                src: resource.resourceURL,
                                alt: "Room Resource Image",
                                class: "userroomresource",
                                css: {
                                    position: "absolute",
                                    left: resource.resourcePositionX + "px",
                                    top: resource.resourcePositionY + "px",
                                    transform: "rotate(" + resource.resourceRotation + "deg) scale(" + resource.resourceScale + ")"
                                }
                            });
                            $("#userroom").append(imgElement);
                        });
                    }
            
                    // Modal과 버튼 업데이트는 rList의 내용과 관계없이 실행
                    const modal = document.querySelector(".friendmodal");
                    modal.style.display = "none";
            
                    var updateRoomButton = $("#btnupdateroom");
                    if (roomHost === window.globaluserId) {
                        // 방의 주인이 나인 경우
                        updateRoomButton.text("방 꾸미기"); // 버튼 텍스트 업데이트
                    } else {
                        // 방의 주인이 내가 아닌 경우
                        updateRoomButton.text("내 방 가기"); // 버튼 텍스트 업데이트
                    }
                } else {
                    console.log("해당 유저의 방 정보가 존재하지 않습니다.");
                    alert("스퀘어에 한번도 접속하지 않은 친구입니다.");
                }
            },
                          error: function (request, status, errorData) {
                              console.log("Error moving to room: ", errorData);
                          }
                      });
                  } else {
                      alert("친구를 선택해주세요.");
                  }
              });
          },
          error: function (request, status, errorData) {
              console.log("error code : " + request.status
                  + "\nMessage : " + request.responseText
                  + "\nError : " + errorData);
          }
      });  // ajax
  });


  // 페이지의 다른 부분을 클릭하면 생성된 버튼들을 제거하는 이벤트 리스너 추가
  function outsideClickListener(event) {
      if (!myCharacter.contains(event.target)) {
          removeDynamicButtons();
          document.removeEventListener('click', outsideClickListener);
      }
  }
  document.addEventListener('click', outsideClickListener);


});
