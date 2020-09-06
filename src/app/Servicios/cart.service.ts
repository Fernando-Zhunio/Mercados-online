import { Injectable } from '@angular/core';
import {ICart} from '../Interfaces/cart';
import { ToastController } from '@ionic/angular';
import { MercadoComponent } from '../Componentes/mercado/mercado.component';
import { Subject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor(public toastController: ToastController) { }
  cart:ICart[]=[];
  idCart:number[]=[];
  $cart = new Subject<ICart[]>();
  getCartAll():Observable<ICart[]>{
    console.log('nada');
    this.$cart.next(this.cart);
    
    return this.$cart.asObservable()}

  addItemCart(newItemCart:ICart){
    this.cart.push(newItemCart);
    // console.log(this.cart);
    this.idCart.push(newItemCart.id);
    this.$cart.next(this.cart);
    this.presentToast('Agregado');
    return {message:'Agregado Correctamente',success:true}
  }

  updateItemCart(id,newCart:ICart){
    if(this.cart.length > 0){
      const cartCount= this.cart.length;
      for (let i = 0; i < cartCount; i++) {
        if (this.cart[i].id == id) {
            // cart.splice(i, 1);
            this.cart[i].id = newCart.id;
            this.cart[i].cantidad = newCart.cantidad;
    this.presentToast('Actualizado');
            return {message:'Actualizado Correctamente',success:true}
        }
      }
      return {message:'Error al Actualizar',success:false}
    }
  }

  deleteItemCart(id){
    let preIndex = this.cart.findIndex(x => x.id === id);
            if (preIndex != -1) {
              this.cart.splice(preIndex, 1);
              this.idCart.splice(preIndex, 1);
              this.$cart.next(this.cart);
              this.presentToast('Eliminado');
              return { success: true, message: 'Eliminado Correctamente'};
            }
            return { success: false, message: 'Error al eliminar'};
  }

  getCartDataBase(){

  }

  async presentToast(message) {
    const toast = await this.toastController.create({
      message,
      duration: 2000
    });
    toast.present();
  }

  getGroupBy(array){
    // groupBy(array) {
      let result = array.reduce(function (r, a) {
        r[a.mercado_nombre] = r[a.mercado_nombre] || [];
        r[a.mercado_nombre].push(a);
        return r;
      }, Object.create(null));
      return result;
    // }
  }

}
