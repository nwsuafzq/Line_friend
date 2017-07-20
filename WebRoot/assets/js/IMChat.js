function IMChat(){
    layer.open({
        type: 2,
        title: '<i class="fa fa-reddit-alien"></i>'+' 实时吐槽聊天墙',
        fix: false,
        shadeClose: true,
        maxmin: true,
        area: ['1000px', '500px'],
        content: 'http://172.29.17.33:3000/',
    });  
}