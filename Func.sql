-- =============================================
-- Author:		Samir
-- Create date: 19/05/2023
-- Description:	Age Tester
-- =============================================
ALTER FUNCTION dbo.ufnCalculateAge
(
  @birthdate DATE,
  @ageThreshold INT
)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @currentDate DATE = GETDATE();
  DECLARE @age INT;

  SET @age = DATEDIFF(YEAR, @birthdate, @currentDate);
  SET @birthdate = DATEADD(YEAR, @age, @birthdate);
  
  IF (@currentDate > @birthdate)
  BEGIN
    IF (DATEDIFF(DAY, @birthdate, @currentDate) >= @ageThreshold)
      RETURN 'Hic biri odemiyor';
    ELSE IF (DATEDIFF(MONTH, @birthdate, @currentDate) > 0)
      RETURN 'Yil oduyor';
    ELSE
      RETURN 'Ay ve gun oduyor';
  END

  RETURN 'Ay, gun ve yil oduyor';
END;
