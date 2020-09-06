import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { TenderoPageRoutingModule } from './tendero-routing.module';

import { TenderoPage } from './tendero.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    TenderoPageRoutingModule
  ],
  declarations: [TenderoPage]
})
export class TenderoPageModule {}
