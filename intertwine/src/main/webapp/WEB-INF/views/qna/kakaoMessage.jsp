<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>카톡 공유</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<input type="button" onClick="sendLinkCustom();" value="Custom"/>
	<input type="button" onClick="sendLinkDefault();" value="Default"/>
	<input type="button" onClick="sendToMe();" value="SendToMe"/>

<script type="text/javascript">

function sendLinkCustom(){
	  Kakao.init('796eb8b0937083754bcfbde8cbec5dfa'); 
	  Kakao.Link.sendCustom({
		 templateId: 106631		 
	  });
}


function sendLinkDefault() {
	Kakao.init('796eb8b0937083754bcfbde8cbec5dfa'); 
	Kakao.Link.sendDefault({
		objectType: 'feed',
		content: {
			title: '딸기 치즈 케익',
			description: '바라만 봐도 즐거워지는 힐링 패키지에는 시크릿 스토리가 숨어있어요.',
            image_url:
                'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
             link: {
               // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
              mobile_web_url: 'https://developers.kakao.com',
              web_url: 'http://localhost:8080/intertwine/',
	         },	
	          social: {
	              like_count: 286,
	              comment_count: 45,
	              shared_count: 845,
	            },
	            buttons: [
	              {
	                title: '웹으로 보기',
	                link: {
	                  mobile_web_url: 'https://developers.kakao.com',
	                  web_url: 'https://developers.kakao.com',
	                },
	              },
	              {
	                title: '앱으로 보기',
	                link: {
	                  mobile_web_url: 'https://developers.kakao.com',
	                  web_url: 'https://developers.kakao.com',
	                },
	              },
	            ],
	          },
	        },
	      })
	        .then(function(res) {
	          alert('success: ' + JSON.stringify(res));
	        })
	        .catch(function(err) {
	          alert('error: ' + JSON.stringify(err));
	        });
	    }

	
function sendToMe() {
  	Kakao.init('796eb8b0937083754bcfbde8cbec5dfa'); 
  	Kakao.API.request({
  	  url: '/v2/api/talk/memo/default/send',
  	  data: {
  	    template_object: {
  	      object_type: 'feed',
  	      content: {
  	        title: '딸기 치즈 케익',
  	        description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
  	        image_url:
  	          'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
  	        link: {
  	          web_url: 'https://developers.kakao.com',
  	          mobile_web_url: 'https://developers.kakao.com',
  	        },
  	      },
  	      item_content: {
  	        profile_text: 'Kakao',
  	        profile_image_url: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
  	        title_image_url: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
  	        title_image_text: 'Cheese cake',
  	        title_image_category: 'Cake',
  	        items: [
  	          {
  	            item: 'Cake1',
  	            item_op: '1000원',
  	          },
  	          {
  	            item: 'Cake2',
  	            item_op: '2000원',
  	          },
  	          {
  	            item: 'Cake3',
  	            item_op: '3000원',
  	          },
  	          {
  	            item: 'Cake4',
  	            item_op: '4000원',
  	          },
  	          {
  	            item: 'Cake5',
  	            item_op: '5000원',
  	          },
  	        ],
  	        sum: 'Total',
  	        sum_op: '15000원',
  	      },
  	      social: {
  	        like_count: 100,
  	        comment_count: 200,
  	      },
  	      buttons: [
  	        {
  	          title: '웹으로 보기',
  	          link: {
  	            mobile_web_url: 'https://developers.kakao.com',
  	            web_url: 'https://developers.kakao.com',
  	          },
  	        },
  	        {
  	          title: '앱으로 보기',
  	          link: {
  	            mobile_web_url: 'https://developers.kakao.com',
  	            web_url: 'https://developers.kakao.com',
  	          },
  	        },
  	      ],
  	    },
  	  },
  	})
  	  .then(function(response) {
  	    console.log(response);
  	  })
  	  .catch(function(error) {
  	    console.log(error);
  	  });
 }



</script>

</body>
</html>
