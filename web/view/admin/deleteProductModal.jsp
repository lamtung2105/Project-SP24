<%-- 
    Document   : deleteProductModal
    Created on : Mar 13, 2024, 1:34:43 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="delete-product-modal" tabindex="-1" role="dialog" aria-labelledby="delete-modal-label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete-modal-label">Xác nhận xoá</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xoá sản phẩm này không?</p>
            </div>
            <div class="modal-footer">
                <form action="product?action=delete" method="POST">
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idDeleteInput" name="id" value="">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-danger">Có</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteProductModal(id) {
        let inputId = document.querySelector("#idDeleteInput");
        inputId.value = id;
    }
</script>