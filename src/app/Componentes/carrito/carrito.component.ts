import { Component, OnInit } from '@angular/core';
import { CartService } from '../../Servicios/cart.service';
import { ModalController } from '@ionic/angular';
import { CarritoDetalleModalComponent } from '../Modals/carrito-detalle-modal/carrito-detalle-modal.component';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.scss'],
})
export class CarritoComponent implements OnInit {

  constructor(private svcCart: CartService,private modalCtrl:ModalController) { }
  subcriptionCart:Subscription;
  cart=[];
  keys=[];
  ngOnInit() {
    this.subcriptionCart =this.svcCart.getCartAll().subscribe(res=>{
      this.cart = this.svcCart.getGroupBy(res);
      console.log({cart:this.cart});
      this.keys = Object.keys(this.cart);
      console.log(this.keys);
    });
    // .getGroupBy();
  }

  ngOnDestroy(): void {
    //Called once, before the instance is destroyed.
    //Add 'implements OnDestroy' to the class.
    this.subcriptionCart.unsubscribe()
  }

  async showDetalle(key){
    
      const modal = await this.modalCtrl.create({
        component: CarritoDetalleModalComponent,
        cssClass: 'my-custom-class',
        componentProps: {productos:this.cart[key],mercado:key,servicioCart:this.svcCart},
      });
      return await modal.present();
    
  }
}
