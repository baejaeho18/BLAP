<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script>
      function selChange() {
         var sel = document.getElementById('cntPerPage').value;
         location.href="readaccount?nowPage=${paging.nowPage}&cntPerPage="+sel;
      }
   </script>
   <!-- 모달 -->
   <style>
            #add_modal, #sub_modal {
                display: none;
                width: 400px;
                height:200px; 
                padding: 10px 60px;
                background-color: #fefefe;
                border: 2px solid black;
                border-radius: 5px;
            }

            #add_modal .modal_close_btn, #sub_modal .modal_close_btn{
                position: absolute;
                top: 5px;
                right: 10px;
            }
            
            
             #add_modal .finish, #sub_modal .finish{
                position: absolute;
                bottom: 10px;
                right: 20px;
            }
            input{
                background-color: #EBEBEB;
                padding: 5px;
                border: 0px;
                text-align: center;
            }
            button{
               border: 0px;
               background-color: white;
            }
        </style>
  </head>

  <body>
   
         
         <!-- style="border: 3px solid purple" -->
         
       <nav class="navbar navbar-expand-sm bg-white navbar-light border-bottom">
     <div class="container-fluid">
         <a href=".">
         <img src="./resources/assets/img/logo.png" alt="blap Logo" style="width:80px; height:55px">
        </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse d-flex justify-content-center" id="collapsibleNavbar" >
         <ul class="navbar-nav">
            <li class="nav-item me-5">
              <a class="nav-link" href="about">ABOUT</a>
            </li>
            <li class="nav-item me-5">
              <a class="nav-link" href="readbucket">BUCKET</a>
            </li>
            <li class="nav-item me-5">
              <a class="nav-link" href="readbudget">BUDGET</a>
            </li>
            <li class="nav-item me-5">
              <a class="nav-link" href="readaccount">PROFILE</a>
            </li>
          </ul>
        </div>
     </div>
   </nav>
   
   <br>
    
          <div class = "row d-flex justify-content-start ms-5 me-5" style="text-align: center;">
            <div class = "col-5 mt-3 d-flex justify-content-start">      
               <div class = "ml-3" style="padding-left: 37px; padding-bottom: 5px;">
                  <img src="./resources/assets/img/user.png" height="70" width="70">
                  <div class="mt-3 ms-2"> 홍길동
                     <a href="SignIn" style="text-decoration-line : none;">
                        <small class = "text-muted"> 로그아웃</small>
                     </a>
                  <div class = "row d-flex justify-content-center" style="text-align:center;" >2000000@gmail.com</div>
               </div>
               </div>
               
               
            </div>      
            
            <!-- 잔여금액 -->
        <div class = "col-6"  >
               <div class = "row mt-5"  >
                  잔여금액
                  <div class = "col-1 " ></div>
                     
                  <c:forEach items="${viewAll}" var="b" varStatus = "status">
                  <c:if test = "${status.count eq 1}">
                  <div class = "col-3  alert-secondary align-middle" style = "text-align:center; line-height: 40px; width: 180px; height: 40px;background-color:#EBEBEB; border-radius:8px;" >${b.getBalance()}</div>
                  </c:if>
                  
                  </c:forEach>   
                  <div class = "col-1" style="line-height: 40px;">₩</div>
                  <div class = "col-3" style = "text-align:center;"><button id="popup_open_btn"><img src="./resources/assets/img/금액추가.png" height="40" width="40"></button><button id="popup_s_open_btn"><img src="./resources/assets/img/금액차감.png" height="42" width="40"></button></div>
               </div>
               
               <!-- 지출내역 -->
            
               <div class = "row mt-3" >지출내역</div>
               <script>var r  = "";</script>
               <!-- 지출내역 한 묶음 현재 입출금 내역이랑 총 내역이 따로 있어서 합치즌 게 나을 거 같기도?? -->
                <c:forEach items="${viewAll}" var="u"> 
               
                
                
                  <div class = "row">
                     <div class = "col-2"></div>
                     
                     <div class = "col-1 "style=" text-align:right;">
                        <script>
                              var r = new Date ('${u.getAccount_date()}');
                              var change = r.getMonth()+1;
                              var change2 = r.getDate();
                              
                              document.write(change + '/' + change2);
                        </script>
                     </div>
                  
               <c:if test = "${u.getType() eq 0}">        
                     <div class = "col-3 " style = "text-align:center; color:#084DFC;display:inline;">+${u.getMoney()}</div>
               </c:if>
               
               <c:if test = "${u.getType() eq 1}">        
                     <div class = "col-3 " style = "text-align:center;color:#FC0808;display:inline;">-${u.getMoney()}</div>
               </c:if>
               
               <c:if test = "${u.getType() eq 2}">        
                     <div class = "col-3 " style = "text-align:center;color:#FC0808;display:inline;">-{u.getMoney()}</div>
               </c:if>
               <div class = "col"></div>   
                  </div>
                  <div class = "row">
                     <div class = "col-3"></div>
                     <div class = "col-3 mb-4" style = "font-size: 15px; text-align:center; color:#8B8B8F; border-radius:8px">${u.getBalance()}원</div>
                  </div>
                  
                  </c:forEach>
               
               <div class="mt-5"style="display: block;  text-align: center; width:50%">      
               <c:if test="${paging.startPage != 1 }">
                  <a href="/blapweb/readaccount?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
               </c:if>
               <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                  <c:choose>
                     <c:when test="${p == paging.nowPage }">
                        <b class="me-3">${p }</b>
                     </c:when>
                     <c:when test="${p != paging.nowPage }">
                        <a href="/blapweb/readaccount?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${paging.endPage != paging.lastPage}">
                  <a href="/blapweb/readaccount?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
               </c:if>
            </div>
            </div>   
            
         </div>
         
         <div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
            <p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
            <p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
         </div>


         <!-- 금액추가모달 -->
          <div id="add_modal">
          <div style = "font-size: 18px; text-align:center; ">예산추가</div>
          
            <form action="addaccountok" method="post">
            <div class = "row mt-4 mb-4 pt-4">
            <div class="col-4" style = "font-size:15px;" >추가할 금액</div>
            <div class="col-3" style = "font-size: 16px; border-radius:3px;" ><input type = "text" name = "money"/></div>
            </div>
            
            <button type = "submit" class="finish" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">완료</button>
            <a class="modal_close_btn" style = "font-size 25px; text-align:center;  text-decoration-line: none; color : black">x</a>
            <input type = "hidden" value="0" name = "type"/>
            </form>
        </div>
        
        <!-- 금액차감모달 -->
          <div id="sub_modal">
          <div style = "font-size: 18px; text-align:center; ">예산차감</div>
             
            <form action="subaccountok" method="post">
            <div class = "row mt-4 mb-4 pt-4">
            <div class="col-4" style = "font-size:15px;" >차감할 금액</div>
            <div class="col-3" style = "font-size: 16px; border-radius:3px;" ><input type = "text" name = "money"/></div>
            <input type = "hidden" value="1" name = "type"/>
            </div>
            
            <button type = "submit" class="finish" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">완료</button>
            <a class="modal_close_btn" style = "font-size 25px; text-align:center;  text-decoration-line: none; color : black">x</a>
            </form>
        </div>
      


              <script>
            function modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.1)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
                
                modal.querySelector('.finish').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            document.getElementById('popup_open_btn').addEventListener('click', function() {
                // 모달창 띄우기
                modal('add_modal');
            });
            document.getElementById('popup_s_open_btn').addEventListener('click', function() {
                // 모달창 띄우기
                modal('sub_modal');
            });
            
        </script>
      
   
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
  </body>
</html>
</html>