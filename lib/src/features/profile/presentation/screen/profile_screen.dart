import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/common/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/application/wrappers/localizations_wrapper.dart';
import 'package:eneler_mariia/src/features/authentication/data/data_sources/external/google_auth.dart';
import 'package:eneler_mariia/src/features/profile/presentation/widgets/exit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _langFlags = <String>[
  'assets/flags/russia.svg',
  'assets/flags/kyrgyzstan.svg',
  'assets/flags/kyrgyzstan.svg',
  'assets/flags/usa.svg'
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String> language = {
    'ru': 'Русский',
    'kk': 'Казахша',
    'ky': 'Кыргызсча',
    'en': 'English'
  };

  

  final userModel = GoogleAuth.instance.userModel;
  @override
  Widget build(BuildContext context) {
    final languageCode = language.keys.map((e) => e).toList();
    final langList = language.values.map((e) => e).toList();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const SizedBox(
              height: 90,
              width: 90,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ),
            // Text(userModel!.userName),
            // Text(userModel!.email, style: descriptionTextStyle),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: 106,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  _SettingItemWidget(
                      iconAssetPath: 'assets/icons/language.svg',
                      title: AppLocalizations.of(context)!.language,
                      voidCallback: () {
                        showSelectLang(languageCode, langList);
                      }),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(202, 202, 202, 1),
                  ),
                  _SettingItemWidget(
                      iconAssetPath: 'assets/icons/exit.svg',
                      title: AppLocalizations.of(context)!.exit,
                      voidCallback: () {
                        Dependencies.of(context)
                            .authDataSources
                            .googleSignOut();
                        // showExitDialog();
                      })
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void showExitDialog() {
    showModalBottomSheet(
        context: context,
        builder: (contex) {
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                const Text("Вы хотите выйти?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ExitButton(
                        color: Colors.red,
                        onPressed: Navigator.of(context).pop,
                        title: 'Выйти'),
                    ExitButton(
                        color: const Color.fromRGBO(96, 101, 214, 1),
                        onPressed: Navigator.of(context).pop,
                        title: 'Отмена'),
                  ],
                )
              ],
            ),
          );
        });
  }

  void selectLanguage(
      BuildContext context, final int index, List<String> languageCode) {
    setState(() {
      LocalizationsWrapper.of(context).selectLanguage(languageCode[index]);
    });

    Navigator.of(context).pop();
  }

  void showSelectLang(List<String> languageCode, List<String> languageList) =>
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: languageList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => selectLanguage(context, index, languageCode),
                      child: ListTile(
                        title: Text(languageList[index]),
                        leading: ClipRect(
                          clipBehavior: Clip.antiAlias,
                          child: CircleAvatar(
                            child: SvgPicture.asset(
                              _langFlags[index],
                              clipBehavior: Clip.antiAlias,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        /// Compare the selected language with an element in the [ languageCode ] list
                        trailing: (LocalizationsWrapper.of(context)
                                    .getInitialLangCode() ==
                                languageCode[index])
                            ? const _SvgIconWidget('assets/icons/select.svg')
                            : const SizedBox(),

                        /// This code [ Error ] does not show  icons
                        // leading: SvgPicture.asset('assets/flags/russia.svg'),
                      ),
                    );
                  }),
            );
          });
}

class _SettingItemWidget extends StatelessWidget {
  const _SettingItemWidget(
      {required this.iconAssetPath,
      required this.title,
      required this.voidCallback});

  final String iconAssetPath;
  final String title;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: InkWell(
        onTap: () => voidCallback.call(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: <Widget>[
              _SvgIconWidget(iconAssetPath),
              const SizedBox(width: 12),
              Text(title),
              const Spacer(),
              const _SvgIconWidget('assets/icons/arrow.svg')
            ],
          ),
        ),
      ),
    );
  }
}

class _SvgIconWidget extends StatelessWidget {
  const _SvgIconWidget(this.assetPath);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: 20,
      width: 20,
    );
  }
}
