function setImagePreview(docObj, localImagId, imgObjPreview, width, height) {
				if (docObj.files && docObj.files[0]) { //����£�ֱ����img����        
					imgObjPreview.style.display = 'block';
					imgObjPreview.style.width = width;
					imgObjPreview.style.height = height;
					//���7���ϰ汾�����������getAsDataURL()��ʽ��ȡ����Ҫ���·�ʽ        
					imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
				} else { //IE�£�ʹ���˾�      
					docObj.select();
					var imgSrc = document.selection.createRange().text;
					//�������ó�ʼ��С        
					localImagId.style.width = width;
					localImagId.style.height = height;
					//ͼƬ�쳣�Ĳ�׽����ֹ�û��޸ĺ�׺��α��ͼƬ        
					try {
						localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
						localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
					} catch (e) {
						alert("���ϴ���ͼƬ��ʽ����ȷ��������ѡ��!");
						return false;
					}
					imgObjPreview.style.display = 'none';
					document.selection.empty();
				}
			}