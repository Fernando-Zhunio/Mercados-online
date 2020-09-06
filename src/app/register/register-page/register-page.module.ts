import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { RegisterPagePageRoutingModule } from './register-page-routing.module';

import { RegisterPagePage } from './register-page.page';

@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    IonicModule,
    RegisterPagePageRoutingModule
  ],
  declarations: [RegisterPagePage]
})
export class RegisterPagePageModule {}
