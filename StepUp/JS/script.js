window.onload = function(){   
    let gnb = document.querySelector("#gnb");
    let header = document.getElementById("header");
    let title = document.querySelector("#gnb>li");
    let target = document.querySelector("#gnb>li>a");
    gnb.addEventListener("mouseover",function(){
        header.style.height = "450px";
        
    });

    gnb.addEventListener("mouseout",function(){
        header.style.height = "100px";
    });

    window.addEventListener("scroll", function(){
        let html = document.documentElement;
        let htmlTop = html.scrollTop;
        if(htmlTop < 1){
            header.style.top= "0";
        }else{
            header.style.top= "-30px";
        }
    });



}



  window.addEventListener("scroll", function(){
    let html = document.documentElement;
    let htmlTop = html.scrollTop;
    let newBanner = this.document.getElementById("new-banner")
    if(newBanner != null){
        if(htmlTop > 50){
            newBanner.style.height = "0vh";
        }else{
            newBanner.style.height = "85vh";
        }
    }
  });




  


