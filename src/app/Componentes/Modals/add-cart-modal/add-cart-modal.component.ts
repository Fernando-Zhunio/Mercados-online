import { Component, OnInit, Input } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { ICart } from 'src/app/Interfaces/cart';
import { CartService } from '../../../Servicios/cart.service';

@Component({
  selector: 'app-add-cart-modal',
  templateUrl: './add-cart-modal.component.html',
  styleUrls: ['./add-cart-modal.component.scss'],
})
export class AddCartModalComponent implements OnInit {

  @Input() producto;
  @Input() end_point;
  @Input() mercado;
  subtotal:any;
  isUpdate:boolean=false;
  newProducto:ICart;
  qty:number = 1;
  text_btn_cart:string="Añadir a carrito";
  constructor(private modalCtrl:ModalController,private svcCart:CartService) { }
  ngOnInit() {
    // this.subtotal = this.producto.precio * this.qty;
    this.subtotalChange();
    const idCart = this.svcCart.idCart;
    const longCart = idCart.length;
    if(longCart > 0){
      for (let i = 0; i < idCart.length; i++) {
        if(this.producto.id == idCart[i]){
          this.text_btn_cart = "Actualizar Producto";
          this.isUpdate = true;
        }
        
      }
    }

  }

  plusQty(){
    this.qty++;
    this.subtotalChange();
  }

  subQty(){
    if(this.qty>1)this.qty--;
    this.subtotalChange()
  }

  subtotalChange(){
    this.subtotal = (this.producto.precio * this.qty).toFixed(2);    
  }

  addItemCart(){
    this.newProducto = {
      cantidad : this.qty,
      descripcion : this.producto.descripcion,
      id : this.producto.id,
      nombre : this.producto.nombre,
      precioUnitario :this.producto.precio,
      mercado_nombre : this.mercado.nombre,
      id_mercado : this.mercado.id
    }
    if(this.isUpdate)this.svcCart.updateItemCart(this.producto.id,this.newProducto);
    else this.svcCart.addItemCart(this.newProducto);
    this.dismissModal();
  }

  dismissModal(){
    this.modalCtrl.dismiss();
  }
}
