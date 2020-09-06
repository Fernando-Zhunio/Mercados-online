import { Component, OnInit, Input } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { CartService } from '../../../Servicios/cart.service';

@Component({
  selector: 'app-carrito-detalle-modal',
  templateUrl: './carrito-detalle-modal.component.html',
  styleUrls: ['./carrito-detalle-modal.component.scss'],
})
export class CarritoDetalleModalComponent implements OnInit {

  @Input() productos;
  @Input() mercado;
  @Input() servicioCart:CartService;
  subtotal
  costo_carrera:number = 2;
  constructor(private modalCtrl:ModalController) { }

  ngOnInit() {}

  subQty(index){
    console.log(this.productos[index].cantidad);
    if(this.productos[index].cantidad > 1)this.productos[index].cantidad--;
  }
  addQty(index){
    this.productos[index].cantidad++;
  }
  dismissModal(){
    this.modalCtrl.dismiss();
  }
  remove(id){
    this.servicioCart.deleteItemCart(id)
  }
}
