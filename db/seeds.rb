# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.destroy_all
Product.destroy_all

Service.create(
  [
    {
      name: 'recalificacion'
    },
    {
      name: 'habilitacion'
    },
    {
      name: 'mantenimiento'
    },
    {
      name: 'conversion'
    },
    {
      name: 'mecanica general'
    },
    {
      name: 'hidraulica'
    }
  ]
)

Product.create(
  [
    {
      name: 'Conmutadores',
      photo: 'https://www.cegaelectronica.com.ar/products/imgs/gnc-ln.jpg',
      price: '300'
    },
    {
      name: 'Valvula de cilindro',
      photo: 'https://sc01.alicdn.com/kf/UTB8Kx8sGgQydeJk43PUq6AyQpXa6.jpg_350x350.jpg',
      price: '200'
    },
    {
      name: 'Valvula de carga interna',
      photo: 'https://www.corgasgnc.com.ar/file/2019/01/valvula-de-carga-interna-600x450.jpg',
      price: '220'
    },
    {
      name: 'Valvula de carga externa',
      photo: 'https://ar.all.biz/img/ar/catalog/96722.png',
      price: '200'
    },
    {
      name: 'Bovina Tomasetto Achille',
      photo: 'https://http2.mlstatic.com/D_NQ_NP_795265-MLA31010734644_062019-V.jpg',
      price: '220'
    },
    {
      name: 'Bovina Tomasetto Lovato',
      photo: 'https://i.ebayimg.com/images/g/ZR0AAOSwY8teH4Op/s-l225.jpg',
      price: '200'
    },
    {
      name: 'Electrovalvula de gas',
      photo: 'https://www.genebre.es/media/contents/product/mh/4120.jpg',
      price: '160'
    },
    {
      name: 'Diafragma Completo',
      photo: 'https://gnvyglprepuestos.com/wp-content/uploads/2020/06/DIAFRAGMA-3RA-GLP-TOMASETTO-ACHILLE-79.90-600x600.jpg',
      price: '220'
    },
    {
      name: 'Bolsa de venteo',
      photo: 'https://lovatoperu.com/img/p/1/9/6/196-large_default.jpg',
      price: '25'
    },
    {
      name: 'Manguera de alta',
      photo: 'https://www.eecgnv.gob.bo/wp-content/uploads/2017/08/manguera-300x225.png',
      price: '100'
    },
    {
      name: 'Manguera de agua',
      photo: 'https://imexportsrl.com/wp-content/uploads/2020/02/mangueras-multiusos-light-duty-rhc-05.jpg',
      price: '40'
    },
    {
      name: 'Cañeria',
      photo: 'https://http2.mlstatic.com/D_NQ_NP_680965-MPE43517807869_092020-V.jpg',
      price: '120'
    },
    {
      name: 'Emulador',
      photo: 'https://image.made-in-china.com/2f0j10pQLfBMaEudcT/-El-equipo-de-GNC-GAS-GNV-Gpl-emulador-para-coche.jpg',
      price: '250'
    }
  ]
)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?