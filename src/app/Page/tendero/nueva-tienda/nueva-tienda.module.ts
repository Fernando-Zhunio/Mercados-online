import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { NuevaTiendaPageRoutingModule } from './nueva-tienda-routing.module';

import { NuevaTiendaPage } from './nueva-tienda.page';
import { Camera } from '@ionic-native/camera/ngx';
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    IonicModule,
    NuevaTiendaPageRoutingModule
  ],
  declarations: [NuevaTiendaPage],
  providers:[
    Camera
  ]
  
})
export class NuevaTiendaPageModule {}
