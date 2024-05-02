import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');


    //Almmacena los datos de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //retorna la instancia de "Message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
