import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { MisTiendasPage } from './mis-tiendas.page';

describe('MisTiendasPage', () => {
  let component: MisTiendasPage;
  let fixture: ComponentFixture<MisTiendasPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MisTiendasPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(MisTiendasPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
