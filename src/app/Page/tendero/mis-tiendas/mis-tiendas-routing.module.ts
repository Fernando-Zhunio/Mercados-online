import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MisTiendasPage } from './mis-tiendas.page';

const routes: Routes = [
  {
    path: '',
    component: MisTiendasPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class MisTiendasPageRoutingModule {}
