import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TenderoPage } from './tendero.page';

const routes: Routes = [
  {
    path: '',
    component: TenderoPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TenderoPageRoutingModule {}
