// $(function(){
//   function appendOption(category){ // optionの作成
//     var html = `&lt;option value="${category.id}"&gt;${category.name}&lt;/option&gt;`;
//     return html;
//   }
//   function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
//     var childSelectHtml = '';
//       childSelectHtml = `&lt;div class='product-select-wrapper' id= 'children_wrapper'&gt;
//                         &lt;div class='product_category-select'&gt;
//                         &lt;select class="category_select-box" id="child_category" name="item[category_id]"&gt;
//                         &lt;option value="---"&gt;---&lt;/option&gt;
//                         ${insertHTML}
//                         &lt;/select&gt;
//                         &lt;i class='fa fa-chevron-down'&gt;&lt;/i&gt;
//                         &lt;/div&gt;
//                         &lt;div class= 'product_select-grandchildren'&gt;
//                         &lt;/div&gt;
//                         &lt;/div&gt;`;
//     $('.product_select-children').append(childSelectHtml);
//   }
//   function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
//     var grandchildrenSelectHtml = '';
//     grandchildrenSelectHtml = `&lt;div class='product-select-wrapper' id= 'grandchildren_wrapper'&gt;
//                               &lt;div class='product_category-select'&gt;
//                               &lt;select class="category_select-box" id="grandchild_category" name="item[category_id]"&gt;
//                               &lt;option value="---"&gt;---&lt;/option&gt;
//                               ${insertHTML} 
//                               &lt;/select&gt;
//                               &lt;i class='fa fa-chevron-down'&gt;&lt;/i&gt;
//                               &lt;/div&gt;
//                               &lt;div class= 'product_select-grandchildren'&gt;
//                               &lt;/div&gt;
//                               &lt;/div&gt;`;
//     $('.product_select-grandchildren').append(grandchildrenSelectHtml);
//   }
 
 
 
//   $('.fieldPulldown').change(function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
//     var productcategory = document.getElementById('category_select').value; 
//      console.log(productcategory)
//   // ↑ productcategoryに選択した親のvalueを代入
//     if (productcategory != ''){
//  // ↑ productcategoryが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
//       $.ajax({
//         url: 'category_children',
//         type: 'GET',
//         data: { productcategory: productcategory },
//         dataType: 'json'
//       })
//       .done(function(children){  // 送られてきたデータをchildrenに代入
//         var insertHTML = '';
//         children.forEach(function(child){  
//   // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
//           insertHTML += appendOption(child); 
//         });
//         appendChidrenBox(insertHTML); 
//         $(document).on('change', '#category_select', function(){
//   // 通信成功時に親の選択肢を変えたらイベント発火｡子と孫を削除｡selectのidにかけるのではなく､親要素にかけないと残ってしまう
//           $('#children_wrapper').remove(); 
//           $('#grandchildren_wrapper').remove();
//         })
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
 
//       })
//     }
//   });
 
 
//   // document､もしくは親を指定しないと発火しない
//   $(document).on('change', '#child_category', function(){
//     var productcategory = document.getElementById('child_category').value;
//     if (productcategory != ''){
//     $.ajax ({
//       url: 'category_grandchildren',
//       type: 'GET',
//       data: { productcategory: productcategory },
//       dataType: 'json'
//     })
//     .done(function(grandchildren){
//       var insertHTML = '';
//       grandchildren.forEach(function(grandchild){
//         insertHTML += appendOption(grandchild);
//         });
//         appendgrandChidrenBox(insertHTML);  
//         $(document).on('change', '#child_category',function(){
//           $('#grandchildren_wrapper').remove();
//           })
//         })  
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })
//     }
//   });
// });