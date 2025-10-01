# 🎨 The Met Museum App

Metropolitan Museum sanat koleksiyonunu keşfetmek için geliştirilmiş modern bir Flutter uygulaması.

> **Not:** Bu proje bir case study olarak sadece 8 saatte geliştirilmiştir.

---

## 📱 Proje Hakkında

Bu proje, The Metropolitan Museum of Art'ın zengin sanat koleksiyonunu mobil platformda sergilemek amacıyla geliştirilmiş bir Flutter uygulamasıdır. Kullanıcılar kategorilere göre sanat eserlerini keşfedebilir, detaylı bilgilere erişebilir ve koleksiyonlarda arama yapabilir.

### ⚠️ Önemli Not
Projedeki bazı veriler (kategoriler ve ana sayfa eser listesi) API'de mevcut olmadığı için statik olarak eklenmiştir. Gerçek bir senaryoda bu veriler de API'den çekilecek şekilde tasarlanmıştır, ancak case study kapsamında veri eksikliği nedeniyle mock data kullanılmıştır.

---

## 🏗️ Teknik Mimari

### State Management & Routing

Proje, **GetX** ve **AutoRouter** entegrasyonunu başarılı bir şekilde gerçekleştirmektedir. Bu iki güçlü kütüphanenin birlikte çalışması genellikle zorlu olsa da, projede clean bir entegrasyon sağlanmıştır. Her iki teknolojinin güçlü yönlerinden faydalanarak, type-safe routing ve reaktif state management bir arada kullanılmıştır.

### Mimari Yapı

Proje, **Clean Architecture** prensiplerine uygun olarak katmanlı bir yapıda geliştirilmiştir:

#### 📁 Katman Yapısı

**Base Layer (Temel Katman)**
- Tüm controller ve repository'lerin miras aldığı base sınıflar
- GetX'in StateMixin özelliği ile otomatik loading/error state yönetimi
- Kod tekrarını önleyen yapı

**Services Layer (Servis Katmanı)**
- **API Service**: Dio tabanlı HTTP client wrapper
  - Global loading state yönetimi
  - Otomatik error handling ve dialog gösterimi
  - Request/Response lifecycle management
  - Timeout ve retry mekanizmaları
- **App Service**: Global uygulama durumu ve tema yönetimi

**Common Layer (Ortak Katman)**
- Yeniden kullanılabilir widget'lar
- Ortak model sınıfları
- Utility fonksiyonlar
- Custom navigation bar ve screen base'leri

**Screens Layer (Ekran Katmanı)**

Her ekran kendi içinde MVC pattern'i takip eder:
- **Controller**: Business logic ve state management
- **Repository**: Data layer, API çağrıları
- **View**: UI components
- **Model**: Screen-specific data models
- **Binding**: Dependency injection

**Router Layer (Yönlendirme Katmanı)**
- AutoRoute configuration
- Type-safe navigation
- Dynamic route parameters
- Custom transitions

---

## 🎯 Mimari Tasarım Desenleri

### 1. Repository Pattern
Veri katmanını business logic'ten ayırmak için Repository Pattern kullanılmıştır. Her ekran kendi repository'sine sahiptir ve tüm API çağrıları bu katmandan yapılır.

### 2. Dependency Injection
GetX'in Binding sistemi kullanılarak her ekran için gerekli dependency'ler lazy olarak inject edilir. Bu sayede memory management optimize edilir ve sadece gerekli olduğunda instance'lar oluşturulur.

### 3. Base Controller Pattern
Tüm controller'ların miras aldığı bir base controller ile ortak fonksiyonaliteler merkezi bir yerden yönetilir. StateMixin entegrasyonu sayesinde loading, error ve success state'leri otomatik handle edilir.

### 4. Custom API Service Wrapper
Dio kütüphanesi üzerine özel bir wrapper yazılarak:
- Global loading indicator
- Centralized error handling
- Automatic dialog management
- Request/response lifecycle control

sağlanmıştır.

### 5. CommonScreen Widget
Tüm ekranlar için ortak bir base widget oluşturulmuş ve her ekran bu widget'ı extend ederek:
- Otomatik GetX binding
- Loading state management
- AppBar configuration
- Bottom navigation
- Floating action button

özelliklerini kazanmıştır.

---

## 📂 Proje Yapısı

```
lib/
├── base/                          # Base sınıflar ve abstract yapılar
├── common/                        # Ortak componentler ve utility'ler
│   ├── model/                     # Ortak model sınıfları
│   └── widget/                    # Yeniden kullanılabilir widget'lar
├── screens/                       # Uygulama ekranları (Feature-based)
│   ├── home_screen/
│   │   ├── controller/           # Controller, Repository, Binding
│   │   ├── model/                # Screen-specific models
│   │   └── view/                 # UI components
│   ├── departments_screen/
│   ├── category_detail_screen/
│   ├── artifact_info_screen/
│   ├── search_screen/
│   └── info_screen/
├── services/                      # Global servisler
│   ├── api_service/              # HTTP client wrapper
│   └── app_service/              # Uygulama state yönetimi
├── router/                        # Routing configuration
│   ├── app_router.dart           # Route tanımlamaları
│   └── app_router.gr.dart        # Generated route dosyası
└── main.dart                      # Entry point
```

## 📝 Notlar

- Bu proje bir case study olarak geliştirilmiştir
- Bazı API endpoint'leri mevcut olmadığı için mock data kullanılmıştır
- GetX ve AutoRouter entegrasyonu özel olarak çözülmüştür
- Genişletmeye ve bakıma uygun bir yapı kurulmuştur


