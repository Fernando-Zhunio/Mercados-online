import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { NuevaTiendaPage } from './nueva-tienda.page';

const routes: Routes = [
  {
    path: '',
    component: NuevaTiendaPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class NuevaTiendaPageRoutingModule {}
