import { Component, OnInit } from '@angular/core';
// import { ModalController } from '@ionic/angular';
// import { CarritoComponent } from 'src/app/Componentes/carrito/carrito.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cliente',
  templateUrl: './cliente.page.html',
  styleUrls: ['./cliente.page.scss'],
})
export class ClientePage  {
  constructor(public route:Router){}

  goCart(){
    console.log(this.route.url);
    
    // console.log('go cart');
    this.route.navigate(['./cliente/mercado/cart']);
  }
 }
