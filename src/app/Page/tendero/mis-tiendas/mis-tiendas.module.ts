import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { MisTiendasPageRoutingModule } from './mis-tiendas-routing.module';

import { MisTiendasPage } from './mis-tiendas.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    MisTiendasPageRoutingModule
  ],
  declarations: [MisTiendasPage]
})
export class MisTiendasPageModule {}
