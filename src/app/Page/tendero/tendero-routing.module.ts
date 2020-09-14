import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TenderoPage } from './tendero.page';
import { TiendasComponent } from '../../Componentes/tiendas/tiendas.component';

const routes: Routes = [
  {
    path: '',component: TenderoPage,
    children:[
      {path:'',redirectTo:'mis-tiendas'},
      {
        path: 'nueva-tienda',
        loadChildren: () => import('../../Page/tendero/nueva-tienda/nueva-tienda.module').then( m => m.NuevaTiendaPageModule)
      },
      {
        path: 'mis-tiendas',
        loadChildren: () => import('../../Page/tendero/mis-tiendas/mis-tiendas.module').then( m => m.MisTiendasPageModule),
        children:[
          {path:'',component:TiendasComponent}
        ]
      }
    ]
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TenderoPageRoutingModule {}
