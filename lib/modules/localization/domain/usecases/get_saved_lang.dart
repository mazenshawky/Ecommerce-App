import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParameters> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParameters params) async =>
      await langRepository.getSavedLang();
}
