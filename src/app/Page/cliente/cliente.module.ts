import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ClientePageRoutingModule } from './cliente-routing.module';

import { ClientePage } from './cliente.page';
import { MercadoComponent } from '../../Componentes/mercado/mercado.component';
import { MercadoDetalleComponent } from '../../Componentes/mercado-detalle/mercado-detalle.component';
import { PuestoDetalleComponent } from '../../Componentes/puesto-detalle/puesto-detalle.component';
import { CarritoComponent } from '../../Componentes/carrito/carrito.component';
import { CarritoDetalleModalComponent } from '../../Componentes/Modals/carrito-detalle-modal/carrito-detalle-modal.component';
// import { PipeCollector } from '@angular/compiler/src/template_parser/binding_parser';
// import { BrowserModule } from '@angular/platform-browser';


@NgModule({
  imports: [
    // BrowserModule,
    CommonModule,
    FormsModule,
    IonicModule,
    ClientePageRoutingModule,
   
  ],
  declarations: [
    // PipeCollector,
    ClientePage,
    MercadoComponent,
    MercadoDetalleComponent,
    PuestoDetalleComponent,
    CarritoComponent,
    CarritoDetalleModalComponent
  ]
})
export class ClientePageModule {}
