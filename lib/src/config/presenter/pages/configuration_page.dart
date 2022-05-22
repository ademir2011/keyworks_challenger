import 'package:flutter/material.dart';
import 'package:keyworkds_challenger/src/widgets/sub_template_widget.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

enum MenuItemEnum {
  portugues,
  ingles,
  espanhol;

  final idiomas = const <String>['Português (Brasil)', 'English', 'Español'];

  @override
  String toString() => idiomas[index];
}

class MenuItem extends ValueNotifier<MenuItemEnum> {
  MenuItem(super.value);
}

class SwitchButton extends ValueNotifier<bool> {
  SwitchButton(super.value);
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final menuItem = MenuItem(MenuItemEnum.portugues);
  final switchButton = SwitchButton(false);
  @override
  Widget build(BuildContext context) {
    return SubTemplateWidget(
      title: 'Configurações',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'Usuário',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  suffixIcon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tema Escuro',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: switchButton,
                    builder: (ctx, value, widget) {
                      return Switch(
                        value: value,
                        onChanged: (newValue) => switchButton.value = newValue,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Idioma',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  ValueListenableBuilder<MenuItemEnum>(
                    valueListenable: menuItem,
                    builder: (ctx, menuItemEnum, widget) {
                      return DropdownButtonHideUnderline(
                        child: Container(
                          width: 250,
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton<MenuItemEnum>(
                            value: menuItem.value,
                            onChanged: (newValue) {
                              menuItem.value = newValue ?? MenuItemEnum.portugues;
                            },
                            dropdownColor: Theme.of(context).colorScheme.onBackground,
                            underline: null,
                            isDense: true,
                            items: MenuItemEnum.values
                                .map<DropdownMenuItem<MenuItemEnum>>(
                                  (value) => DropdownMenuItem<MenuItemEnum>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 75),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Text(
                    'SALVAR',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
