import 'package:flutter/material.dart';

void main() => runApp(const Friend3App());

class Friend3App extends StatelessWidget {
  const Friend3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend3',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff101010),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffa77bff),
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff242329),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text('Friend3',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900)),
              const SizedBox(height: 12),
              Text('发现有趣的人，分享真实生活。',
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: .68),
                      fontSize: 18)),
              const SizedBox(height: 34),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    gradient: const LinearGradient(
                        colors: [Color(0xff6f4de6), Color(0xffef7db7)])),
                child: const Center(
                    child: Icon(Icons.people_alt_rounded, size: 100)),
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginPage())),
                      child: const Text('开始使用'))),
              const SizedBox(height: 12),
              Center(
                  child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPage())),
                      child: const Text('创建新账号'))),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '登录',
        subtitle: '使用邮箱或手机号登录',
        child: Column(
          children: [
            const _AuthField(label: '邮箱或手机号', icon: Icons.person_outline),
            const SizedBox(height: 14),
            const _AuthField(
                label: '密码', icon: Icons.lock_outline, obscureText: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ResetPasswordPage())),
                child: const Text('验证码找回密码'),
              ),
            ),
            const SizedBox(height: 10),
            _PrimaryAuthButton(
                label: '登录',
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Friend3Shell()))),
            const SizedBox(height: 20),
            const Text('或使用以下方式登录'),
            const SizedBox(height: 16),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _SocialLogin(icon: Icons.mail_outline, label: '邮箱'),
                  _SocialLogin(icon: Icons.chat_bubble_outline, label: '微信'),
                  _SocialLogin(icon: Icons.people_outline, label: 'QQ'),
                ]),
            const SizedBox(height: 18),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterPage())),
                child: const Text('还没有账号？立即注册')),
          ],
        ),
      );
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '注册',
        subtitle: '创建账号，开始你的 Friend3 旅程',
        child: Column(
          children: [
            const _AuthField(label: '用户名', icon: Icons.person_outline),
            const SizedBox(height: 14),
            const _AuthField(label: '邮箱或手机号', icon: Icons.alternate_email),
            const SizedBox(height: 14),
            const _AuthField(
                label: '设置密码', icon: Icons.lock_outline, obscureText: true),
            const SizedBox(height: 24),
            _PrimaryAuthButton(
                label: '继续',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ProfileSetupPage()))),
            const SizedBox(height: 14),
            TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginPage())),
                child: const Text('已有账号？返回登录')),
          ],
        ),
      );
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '找回密码',
        subtitle: '输入绑定信息获取验证码',
        child: Column(
          children: [
            const _AuthField(label: '邮箱或手机号', icon: Icons.person_outline),
            const SizedBox(height: 14),
            const _AuthField(label: '验证码', icon: Icons.verified_outlined),
            const SizedBox(height: 24),
            _PrimaryAuthButton(
                label: '确认', onTap: () => Navigator.pop(context)),
          ],
        ),
      );
}

class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({super.key});
  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '手机号登录',
        subtitle: '使用手机号和验证码登录',
        child: Column(children: [
          const _AuthField(label: '国家/地区 +86', icon: Icons.language),
          const SizedBox(height: 14),
          const _AuthField(label: '手机号码', icon: Icons.phone_outlined),
          const SizedBox(height: 14),
          const _AuthField(label: '验证码', icon: Icons.verified_outlined),
          const SizedBox(height: 24),
          _PrimaryAuthButton(
              label: '登录',
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const Friend3Shell()))),
        ]),
      );
}

class EmailRegisterPage extends StatelessWidget {
  const EmailRegisterPage({super.key});
  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '邮箱注册',
        subtitle: '使用邮箱创建 Friend3 账号',
        child: Column(children: [
          const _AuthField(label: '邮箱地址', icon: Icons.email_outlined),
          const SizedBox(height: 14),
          const _AuthField(label: '邮箱验证码', icon: Icons.verified_outlined),
          const SizedBox(height: 24),
          _PrimaryAuthButton(
              label: '下一步',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PasswordSetupPage()))),
        ]),
      );
}

class PasswordSetupPage extends StatelessWidget {
  const PasswordSetupPage({super.key});
  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '设置密码',
        subtitle: '为你的 Friend3 账号设置安全密码',
        child: Column(children: [
          const _AuthField(
              label: '设置密码', icon: Icons.lock_outline, obscureText: true),
          const SizedBox(height: 14),
          const _AuthField(
              label: '确认密码',
              icon: Icons.lock_reset_outlined,
              obscureText: true),
          const SizedBox(height: 24),
          _PrimaryAuthButton(
              label: '完成注册',
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const Friend3Shell()),
                  (_) => false)),
        ]),
      );
}

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) => AuthScaffold(
        title: '完善资料',
        subtitle: '让大家更快认识你',
        child: Column(
          children: [
            const CircleAvatar(
                radius: 46, child: Icon(Icons.add_a_photo_outlined, size: 30)),
            const SizedBox(height: 20),
            const _AuthField(label: '昵称', icon: Icons.badge_outlined),
            const SizedBox(height: 14),
            const _AuthField(label: '一句话介绍自己', icon: Icons.edit_outlined),
            const SizedBox(height: 14),
            const _AuthField(label: '选择兴趣标签', icon: Icons.local_offer_outlined),
            const SizedBox(height: 24),
            _PrimaryAuthButton(
                label: '完成',
                onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Friend3Shell()),
                    (_) => false)),
          ],
        ),
      );
}

class AuthScaffold extends StatelessWidget {
  const AuthScaffold(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.child});
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(subtitle,
              style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 15)),
          const SizedBox(height: 30),
          child,
        ],
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField(
      {required this.label, required this.icon, this.obscureText = false});
  final String label;
  final IconData icon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) => TextField(
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)));
}

class _PrimaryAuthButton extends StatelessWidget {
  const _PrimaryAuthButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(onPressed: onTap, child: Text(label)));
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Column(children: [
        CircleAvatar(radius: 23, child: Icon(icon)),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12))
      ]);
}

class Friend3Shell extends StatefulWidget {
  const Friend3Shell({super.key});
  @override
  State<Friend3Shell> createState() => _Friend3ShellState();
}

class _Friend3ShellState extends State<Friend3Shell> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const Friend3HomePage(),
      const DiscoverPage(),
      const NotificationsPage(),
      const Friend3ProfilePage()
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: '首页'),
            NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: '发现'),
            NavigationDestination(
                icon: Icon(Icons.notifications_none),
                selectedIcon: Icon(Icons.notifications),
                label: '通知'),
            NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: '我的'),
          ]),
    );
  }
}

class Friend3HomePage extends StatelessWidget {
  const Friend3HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('首页', style: TextStyle(fontWeight: FontWeight.w800)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ]),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
          children: [
            const _SectionTitle(title: '主播推荐', action: '查看全部'),
            SizedBox(
                height: 114,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (_, index) => _CreatorChip(index: index))),
            const SizedBox(height: 10),
            const _SectionTitle(title: '首页推荐', action: '更多'),
            const _FeaturePostCard(),
            const SizedBox(height: 16),
            const _SectionTitle(title: '为你推荐', action: '刷新'),
            const _RecommendationRow(),
            const _RecommendationRow(),
            const SizedBox(height: 18),
            _HomeQuickActions(
              onCreatePost: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreatePostPage()),
              ),
            ),
          ]),
    );
  }
}

class _HomeQuickActions extends StatelessWidget {
  const _HomeQuickActions({required this.onCreatePost});

  final VoidCallback onCreatePost;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickAction(
            icon: Icons.add_box_outlined,
            label: '创建帖子',
            onTap: onCreatePost,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _QuickAction(
            icon: Icons.notifications_none,
            label: '通知中心',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            ),
          ),
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Icon(icon),
        title: Text(label, style: const TextStyle(fontSize: 13)),
        trailing: const Icon(Icons.chevron_right, size: 18),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('发现', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: '搜索话题、活动和用户')),
        const SizedBox(height: 18),
        _DiscoverTile(
            icon: Icons.local_fire_department,
            title: '热门话题',
            subtitle: '看看大家正在讨论什么',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const TopicPage()))),
        _DiscoverTile(
            icon: Icons.event_available,
            title: '活动中心',
            subtitle: '参加线上线下有趣活动',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EventsPage()))),
        _DiscoverTile(
            icon: Icons.trending_up,
            title: '趋势榜单',
            subtitle: '本周最受关注的内容',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TrendsPage()))),
        const SizedBox(height: 18),
        const Text('热门话题',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ['周末去哪儿', '电影分享', '城市漫步', '新朋友']
              .map((e) => Chip(label: Text('#$e')))
              .toList(),
        ),
      ]),
    );
  }
}

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建帖子'),
        actions: [TextButton(onPressed: () {}, child: const Text('发布'))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const TextField(
            maxLines: 7,
            decoration: InputDecoration(
              hintText: '分享此刻的想法…',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              _MediaAction(icon: Icons.photo_outlined, label: '图片'),
              _MediaAction(icon: Icons.videocam_outlined, label: '视频'),
              _MediaAction(icon: Icons.tag, label: '话题'),
            ],
          ),
          const SizedBox(height: 24),
          const Text('可见范围', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.public),
            title: Text('所有人可见'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知', style: TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: const [
          _NotificationRow(
              icon: Icons.favorite, title: '点赞通知', subtitle: '还没有新的点赞'),
          _NotificationRow(
              icon: Icons.chat_bubble_outline,
              title: '评论通知',
              subtitle: '还没有新的评论'),
          _NotificationRow(
              icon: Icons.person_add_alt_1, title: '关注通知', subtitle: '还没有新的关注'),
          _NotificationRow(
              icon: Icons.campaign_outlined, title: '系统通知', subtitle: '暂无系统通知'),
        ],
      ),
    );
  }
}

class Friend3ProfilePage extends StatelessWidget {
  const Friend3ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('我的', style: TextStyle(fontWeight: FontWeight.w800)),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsPage())),
                icon: const Icon(Icons.settings_outlined))
          ]),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        const Row(children: [
          CircleAvatar(radius: 38, child: Icon(Icons.person, size: 42)),
          SizedBox(width: 14),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('Friend 用户',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                SizedBox(height: 6),
                Text('这是我的个人介绍')
              ]))
        ]),
        const SizedBox(height: 24),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _Stat(value: '0', label: '帖子'),
          _Stat(value: '0', label: '关注'),
          _Stat(value: '0', label: '粉丝')
        ]),
        const SizedBox(height: 24),
        _ProfileAction(
            icon: Icons.edit_outlined,
            title: '编辑资料',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const EditProfilePage()))),
        _ProfileAction(
            icon: Icons.article_outlined,
            title: '我的帖子',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MyPostsPage()))),
        _ProfileAction(
            icon: Icons.manage_accounts_outlined,
            title: '账户设置',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SettingsPage()))),
        _ProfileAction(
            icon: Icons.swap_horiz,
            title: '切换账户',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AccountSwitchPage()))),
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CreatePostPage())),
          icon: const Icon(Icons.add),
          label: const Text('发帖')),
    );
  }
}

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});
  @override
  Widget build(BuildContext context) => _SimpleListPage(
        title: '热门话题',
        items: const ['周末去哪儿', '电影分享', '城市漫步', '新朋友', '美食探店'],
      );
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) => _SimpleListPage(
        title: '活动中心',
        items: const ['周末线下见面会', '城市摄影活动', '兴趣交友派对', '创作者交流会'],
      );
}

class TrendsPage extends StatelessWidget {
  const TrendsPage({super.key});
  @override
  Widget build(BuildContext context) => _SimpleListPage(
        title: '趋势榜单',
        items: const ['本周热门动态', '最受欢迎用户', '热门兴趣圈', '城市热度排行'],
      );
}

class MyPostsPage extends StatelessWidget {
  const MyPostsPage({super.key});
  @override
  Widget build(BuildContext context) => _SimpleListPage(
        title: '我的帖子',
        items: const ['暂无帖子', '创建你的第一条动态'],
      );
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text('编辑资料'),
            actions: [TextButton(onPressed: () {}, child: const Text('保存'))]),
        body: ListView(padding: const EdgeInsets.all(18), children: const [
          Center(
              child: CircleAvatar(
                  radius: 44,
                  child: Icon(Icons.add_a_photo_outlined, size: 30))),
          SizedBox(height: 22),
          TextField(decoration: InputDecoration(labelText: '昵称')),
          SizedBox(height: 14),
          TextField(decoration: InputDecoration(labelText: '个人简介')),
          SizedBox(height: 14),
          TextField(decoration: InputDecoration(labelText: '城市')),
          SizedBox(height: 14),
          TextField(decoration: InputDecoration(labelText: '兴趣标签')),
        ]),
      );
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('账户设置')),
        body: ListView(padding: const EdgeInsets.all(18), children: [
          const _SettingsGroup(
              title: '账号与安全', items: ['账号信息', '修改密码', '绑定邮箱和手机号']),
          const _SettingsGroup(title: '隐私与通知', items: ['隐私设置', '通知设置', '黑名单']),
          const _SettingsGroup(
              title: '其他', items: ['清理缓存', '关于 Friend3', '退出登录']),
        ]),
      );
}

class AccountSwitchPage extends StatelessWidget {
  const AccountSwitchPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('切换账户')),
        body: ListView(padding: const EdgeInsets.all(18), children: [
          const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Friend 用户'),
              trailing: Icon(Icons.check_circle)),
          ListTile(
              leading: const CircleAvatar(child: Icon(Icons.add)),
              title: const Text('添加其他账户'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginPage()))),
        ]),
      );
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.items});
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 8),
            child: Text(title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700))),
        Card(
          child: Column(
            children: items
                .map((item) => ListTile(
                      title: Text(item),
                      trailing: const Icon(Icons.chevron_right),
                    ))
                .toList(),
          ),
        ),
      ]);
}

class _SimpleListPage extends StatelessWidget {
  const _SimpleListPage({required this.title, required this.items});
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(items[index]),
                    subtitle: const Text('静态演示内容'),
                    trailing: const Icon(Icons.chevron_right)))),
      );
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.action});
  final String title;
  final String action;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 10),
      child: Row(children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const Spacer(),
        Text(action,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))
      ]));
}

class _CreatorChip extends StatelessWidget {
  const _CreatorChip({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) => SizedBox(
      width: 76,
      child: Column(children: [
        CircleAvatar(
            radius: 31,
            backgroundImage: AssetImage(
                index.isEven ? 'assets/story.jpg' : 'assets/mystory.jpg')),
        const SizedBox(height: 7),
        Text('用户${index + 1}', overflow: TextOverflow.ellipsis)
      ]));
}

class _FeaturePostCard extends StatelessWidget {
  const _FeaturePostCard();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/story.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.black54,
          child: const Text(
            '今天也要发现一点小惊喜',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class _RecommendationRow extends StatelessWidget {
  const _RecommendationRow();
  @override
  Widget build(BuildContext context) => const ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text('推荐用户'),
      subtitle: Text('分享了新的生活动态'),
      trailing: Icon(Icons.chevron_right));
}

class _DiscoverTile extends StatelessWidget {
  const _DiscoverTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(child: Icon(icon)),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
        ),
      );
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow(
      {required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right));
}

class _MediaAction extends StatelessWidget {
  const _MediaAction({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Expanded(
          child: Column(children: [
        IconButton.filledTonal(onPressed: () {}, icon: Icon(icon)),
        Text(label)
      ]));
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Column(children: [
        Text(value,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
        Text(label, style: TextStyle(color: Colors.white.withValues(alpha: .6)))
      ]);
}

class _ProfileAction extends StatelessWidget {
  const _ProfileAction(
      {required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
      child: ListTile(
          onTap: onTap,
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right)));
}
