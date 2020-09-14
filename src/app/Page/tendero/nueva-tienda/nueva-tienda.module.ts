import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { NuevaTiendaPageRoutingModule } from './nueva-tienda-routing.module';

import { NuevaTiendaPage } from './nueva-tienda.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    IonicModule,
    NuevaTiendaPageRoutingModule
  ],
  declarations: [NuevaTiendaPage]
})
export class NuevaTiendaPageModule {}
