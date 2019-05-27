(function () {
    var mySwiper = new Swiper('.swiper-container', {
        centeredSlides: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        direction: 'horizontal', // 水平切换选项
        loop: true, // 循环模式选项
        effect: 'coverflow',
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
        },
    });    
})();