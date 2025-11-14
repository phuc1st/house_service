# === RULE: QUY TRÌNH Migrate React → Flutter (Feature-First, Mobile-First) ===

## 1. Triết lý chung
1. **Feature-First Architecture** – Mọi thư mục gốc trong `lib/features` đại diện cho **một vai trò** (student, admin, auth…). Bên trong phân rã theo **feature** (`lessons`, `roadmap`, `vocabulary`…), rồi tiếp tục theo **sub-feature** (ví dụ: `dashboard`, `info`, `learning`, `overview`).
2. **Mobile-First & Responsive** – Layout ưu tiên một cột, scroll dọc, sử dụng `SafeArea`, `SingleChildScrollView`, bottom sheets, drawer… Mọi kích thước, padding, radius phải bám sát design React.
3. **State Management với Riverpod 3** – Không dùng `StateProvider`. Mặc định dùng `NotifierProvider`/`AsyncNotifierProvider`. Tách file provider dưới `presentation/providers` cùng cấp với widgets để dễ truy xuất.
4. **Batch Workflow** – Mỗi React page chuyển thành một Flutter page trước (skeleton + placeholders). Các phần tử con được tách thành widget riêng trong cùng sub-feature. Sau đó mới lấp logic/UI chi tiết theo từng batch.
5. **Style consistency** – Ưu tiên `Theme.of(context).colorScheme` + `textTheme`. Tránh hard-code màu; dùng `withValues(alpha: …)` thay vì `withOpacity`.

## 2. Mapping React → Flutter

### 2.1 React Page (`src/pages/<role>/<FeatureName>.jsx`)
→ `lib/features/<role>/<feature>/<sub-feature>/presentation/pages/<feature_name>_page.dart`

Ví dụ:
- `LessonInfo.jsx` → `lib/features/student/lessons/info/presentation/pages/lesson_info_page.dart`
- `LessonClassrom.jsx` → `lib/features/student/lessons/classroom/presentation/pages/lesson_classroom_page.dart`
- `MyRoadmap.jsx` → `lib/features/student/roadmap/overview/presentation/pages/my_roadmap_page.dart`

### 2.2 React Component nội bộ page
→ `lib/features/<role>/<feature>/<sub-feature>/presentation/widgets/<component_name>.dart`

Ví dụ:
- `LessonInfoTabs.jsx` → `lesson_info_tab_section.dart`
- `LearningSidebar.jsx` → `learning_sidebar.dart`
- `RoadmapHeroCard.jsx` → `my_roadmap_hero_card.dart`

### 2.3 React common component (`src/components/common`)
→ `lib/shared/widgets/`

Ví dụ: `Button.jsx` → `app_button.dart`, `Input.jsx` → `custom_text_field.dart`.

### 2.4 Hooks / Utils
- React hook → `presentation/providers/` hoặc `shared/providers/`
- Utility dùng chung → `lib/shared/utils/`, hằng số → `lib/shared/constants/`

## 3. Cấu trúc thư mục chuẩn cho một sub-feature
```
lib/features/<role>/<feature>/<sub-feature>/
├── presentation/
│   ├── pages/
│   │   └── <feature_name>_page.dart
│   ├── widgets/
│   │   ├── <widget_name>.dart
│   │   └── ...
│   └── providers/                # Tuỳ chọn, khi UI cần state riêng
└── shared/                       # (Tuỳ chọn) model/data riêng của feature
```

*Nếu widget dùng chung giữa nhiều sub-feature cùng feature → đặt ở `lib/features/<role>/<feature>/shared/widgets/`.  
Nếu dùng toàn app → `lib/shared/widgets/`.*

## 4. Quy tắc đặt tên
- **File**: snake_case (`lesson_learning_page.dart`, `my_roadmap_overview_card.dart`).
- **Class/Widget**: PascalCase (`LessonLearningPage`, `MyRoadmapOverviewCard`).
- **Provider**: `<Tên>Notifier`, `<feature>Provider`. Ví dụ `ActiveTabNotifier`, `currentLessonProvider`.
- **Route path**: `/lesson-learning`, `/my-roadmap`. Tên route dùng kebab-case giống path.

## 5. Quy trình migrate từng React page
1. **Định vị role/feature/sub-feature** (tham chiếu `plan.md` & conversation).
2. **Tạo skeleton**:
    - Page: `Scaffold` + `SafeArea` + `SingleChildScrollView` (nếu nội dung dài).
    - Widget con: tạo file trong `widgets/`, để `Container` + placeholder text nếu chưa có nội dung.
    - Provider: tạo file trong `presentation/providers/` dùng Riverpod Notifier.
3. **Ghép layout**: lấy các widget con vào page, đảm bảo thứ tự giống React, giữ spacing/padding.
4. **Điều hướng**: thêm route mới trong `lib/features/<role>/routing.dart`, import vào `app_router.dart` (nếu cần). Path bắt đầu bằng `/`.
5. **Lấp logic/UI chi tiết** theo batch:
    - Ưu tiên UI mobile-first (ví dụ: sidebar → Drawer, right panel → BottomSheet).
    - Dùng `AnimatedSize`, `AnimatedSwitcher` cho transition, tránh overflow.
    - Tab động: dùng `TabController` + `GlobalKey` để đo height khi cần (như `lesson_info_tab_section.dart`, `classroom_tab_bar.dart`).
6. **Kiểm tra**: `flutter analyze lib/features/<role>/<feature>` sau mỗi batch.

## 6. Mẫu tham chiếu

### 6.1 Lessons
- `lesson_learning_page.dart`: Page → Drawer (sidebar), `DraggableScrollableSheet` (right sidebar), TabBar + Riverpod Notifier cho tab.
- Widgets con trong `learning/presentation/widgets/` (`learning_sidebar.dart`, `learning_tab_bar.dart`, ...).
- Providers trong `learning/presentation/providers/learning_providers.dart`.

### 6.2 Roadmap
- `my_roadmap_page.dart`: 1 column layout, background gradient + blur, 3 widget con (`my_roadmap_header.dart`, `my_roadmap_hero_card.dart`, `my_roadmap_overview_card.dart`).
- Providers trong `roadmap/overview/presentation/providers/roadmap_providers.dart` quản lý danh sách cấp độ và state dropdown.

## 7. Checklist trước khi hoàn tất một batch
- [ ] Tất cả file Flutter mới theo đúng path/ten đã quy định.
- [ ] Layout mobile-first, không overflow trên màn hình nhỏ.
- [ ] State dùng Riverpod Notifier, không còn `StateProvider`.
- [ ] Route mới (nếu có) đã thêm vào `routing.dart`.
- [ ] `flutter analyze` không cảnh báo (đặc biệt tránh `withOpacity`, `surfaceVariant` deprecated).
- [ ] Ghi nhận thay đổi vào `plan.md`/Memory Bank nếu cần.

# ========================================